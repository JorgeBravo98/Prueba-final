class Profesores::SessionsController < Devise::SessionsController
    # Aquí puedes personalizar el comportamiento del inicio de sesión para profesores
    def new
      super
    end
  
    def create
      super
    end
  
    def destroy
      super
    end
  end
  