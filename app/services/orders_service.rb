# frozen_string_literal: true

require 'rqrcode'
require 'barby/barcode/qr_code'
require 'barby/outputter/svg_outputter'

module OrdersService
  def self.add_ticket_to_order(ticket, order)
    message = if order.add(ticket, ticket.price)
                'Your ticket has been added to your order.'
              else
                'Something went wrong. Please try again.'
              end
    message
  end

  def self.generate_ticket(user, item)
    item.quantity.times do
      ticket = user.event_tickets.create(campaign: item.item.ticket.campaign)
      generate_attach_distribute_pdf(user, ticket.reload)
      EventTicketMailer.with(user: user, ticket: ticket).deliver_ticket.deliver_later
    end
  end

  def self.generate_attach_distribute_pdf(_user, ticket)
    barcode = Barby::QrCode.new(ticket.uuid).to_svg
    logo_path = File.expand_path(Rails.root.join('app', 'assets', 'images', 'venue_logo_small.png'))

    pdf = Prawn::Document.new(page_size: [250, 400], top_margin: 0, bottom_margin: 50, left_margin: 0, right_margin: 0)
    pdf.fill_color '000000'
    pdf.fill_rectangle [pdf.bounds.left, pdf.bounds.top], pdf.bounds.width, 50
    pdf.fill_color 'FFFFFF'
    pdf.text_box 'YOUR TICKET', at: [pdf.bounds.left, pdf.bounds.top - 15], size: 20, style: :bold, align: :center
    pdf.fill_color '000000'
    pdf.image logo_path, at: [pdf.bounds.left + 100, pdf.bounds.bottom - 15], align: :right, scale: 0.15

    pdf.move_down(65)
    pdf.text 'Venue proudly presents:', align: :center
    pdf.move_down(10)
    pdf.text ticket.campaign.title, style: :bold, align: :center
    pdf.svg barcode, width: 220, position: :center
    pdf.move_down(10)
    pdf.text "No: #{ticket.uuid}", size: 6, align: :center

    filename = "#{ticket.campaign.title}-#{Time.now.to_i}"
    pdf.render_file("tmp/#{filename}.pdf")
    ticket.pdf.attach(io: File.open("tmp/#{filename}.pdf"), filename: 'ticket.pdf', content_type: 'application/pdf')
    File.delete("tmp/#{filename}.pdf")
  end
end
