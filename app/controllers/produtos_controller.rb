class ProdutosController < ApplicationController

	before_action :set_produtos, only: [:edit, :update, :destroy]

	def index 
		@produtos = Produto.order(nome: :asc).limit 10
		@produto_com_desconto = Produto.order(:preco).limit 1
	end

	def new
		@produtos = Produto.new
		@departamentos = Departamento.all
	end
    
    def edit
       
       renderiza :edit
    end
    
    def update
        
            if @produtos.update produtos_params
            flash[:notice] = "Produto atulalizado com sucesso!"
            redirect_to root_url
        else
            renderiza :edit
        end
    end

	def create
		@produtos = Produto.new produtos_params
		if @produtos.save
			flash[:notice] = "Pruduto salvo com sucesso"
			redirect_to root_url
		else
			renderiza :new
		end
	end

	def destroy
		@produtos.destroy 
		redirect_to root_url
	end

	def busca
		@nome = params[:nome]
		@produtos = Produto.where "nome like ?", "%#{@nome}%"
	end

	private

	def produtos_params
		params.require(:produto).permit(:nome, :descricao, :preco, :quantidade, :departamento_id)
	end

	def set_produtos
		@produtos = Produto.find(params[:id])
	end
	
	def renderiza(view)
		@departamentos = Departamento.all
        render view
	end
end
