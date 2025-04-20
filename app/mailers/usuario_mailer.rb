class UsuarioMailer < ApplicationMailer
  def notificacao_vencimento(usuario, contas)
    @contas = contas
    @usuario = usuario

    mail(
      to: usuario.email,
      subject: "Lembrete: #{@contas.size} conta(s) vence(m) em breve"
    )
  end
end
