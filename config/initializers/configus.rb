Configus.build Rails.env do
  env :production do
    mailer do
      host "yandex.ru"
      from "shumilkin.gena@yandex.ru"
    end
  end

  env :development, parent: :production

  env :test, parent: :production
end