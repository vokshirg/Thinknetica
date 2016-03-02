class TicketsMailer < ApplicationMailer
  def buy_ticket(passanger, ticket)
    @passanger = passanger
    @ticket = ticket
    mail(to: passanger.email, subject: "Вы купили билет")
  end
end
