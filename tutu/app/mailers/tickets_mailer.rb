class TicketsMailer < ApplicationMailer

  def buy_ticket(passanger, ticket)
    @passanger = passanger
    @ticket = ticket
    mail(to: passanger.email, subject: "Вы купили билет")
  end

  def del_ticket(ticket)
    @ticket = ticket
    mail(to: ticket.passanger.email, subject: "Вы удалили билет")
  end
end
