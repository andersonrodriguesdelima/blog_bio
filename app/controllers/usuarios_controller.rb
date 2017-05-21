class UsuariosController < ApplicationController
  def new
    @user = Usuario.new
  end
  def create
    @user = Usuario.new(user_params)
    if @user.save
      redirect_to @user, notice: "Usuário foi criado com sucesso!"
      sign_in(@user)
      redirect_to root_url
    else 
      render action: :new
    end
  end

  private
  def user_params
    params.require(:usuario).permit(:nome, :email, :password, :password_confirmation)
  end
end