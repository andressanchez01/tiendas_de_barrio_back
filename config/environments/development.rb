Rails.application.configure do
  # Recarga el código automáticamente en cada solicitud.
  config.cache_classes = false

  # No carga el código cuando la aplicación se inicia.
  config.eager_load = false

  # Mostrar errores completos.
  config.consider_all_requests_local = true

  # Configuración para la acción de envío de correo en desarrollo (se usa Letter Opener o similar para desarrollo local)
  config.action_mailer.raise_delivery_errors = false

  # En lugar de enviar correos electrónicos, abrimos una previsualización en el navegador
  config.action_mailer.delivery_method = :letter_opener

  # Configurar la URL base para los correos electrónicos (debe coincidir con el host local)
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # Deprecaciones en la consola de Rails
  config.active_support.deprecation = :log

  # Usar un servidor de archivos locales para el almacenamiento de archivos
  config.active_storage.service = :local

  # Permitir el uso de web-console y otros depuradores locales.
  config.web_console.whitelisted_ips = '127.0.0.1'

  # Otras configuraciones...
end
