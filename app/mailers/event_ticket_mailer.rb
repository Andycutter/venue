# frozen_string_literal: true

class EventTicketMailer < ApplicationMailer
  def deliver_ticket
    @user = params[:user]
    @ticket = params[:ticket]
    attachments[@ticket.pdf.blob.filename.to_s] = { mime_type: 'application/pdf',
                                                    content: @ticket.pdf.blob.download }
    mail(to: @user.email, subject: "Here's your Ticket!")
  end
end
