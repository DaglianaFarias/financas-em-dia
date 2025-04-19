class UsuarioMailer < ApplicationMailer
  def notificacao_vencimento(contas)
    @contas = contas
    @usuario = Usuario.first
  
    mail(to: "dagliana.farias14@gmail.com", subject: "Lembrete: #{@contas.size} conta(s) vence(m) em breve")
  end  
end
