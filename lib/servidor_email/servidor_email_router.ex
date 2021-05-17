defmodule ServidorEmail.Router do
  use Plug.Router
  use Plug.Debugger
  require Logger
  import Bamboo.Email


plug(Plug.Logger, log: :debug)
plug(:match)
plug(:dispatch)

get "/" do

 new_email()
 |> to("meu@email.com")
 |> from("meu@email.com")
 |> subject("Teste")
 |> text_body("Testando envio de email")
 |> ServidorEmail.Mailer.deliver_now

  send_resp(conn, 200, "Server rodando...")
end


match _ do
  send_resp(conn, 404, "Pagina não encontrada")
end

end
