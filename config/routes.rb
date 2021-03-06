Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
            
      get    'students'                 => 'students#mostrar'
      get    'students/:id'             => 'students#find'
      post   'students'                 => 'students#save'
      post   'students/dados_completos' => 'students#exibe_dados_completos'
      put    'students'                 => 'students#update' 
      delete 'students/:id'             => 'students#remove'

      get    'orientadores'             => 'advisors#index'
      get    'orientadores/:id'         => 'advisors#find'     
      post   'orientadores'             => 'advisors#save'
      post   'orientadores/all'         => 'advisors#save_all'
      put    'orientadores'             => 'advisors#update'
      delete 'orientadores/:id'         => 'advisors#remove'

      get    'contas'                   => 'contas#index'
      get    'contas/:id'               => 'contas#find'
      post   'contas'                   => 'contas#save'     
      put    'contas'                   => 'contas#update'     
      delete 'contas/:id'               => 'contas#remove'

      get    'lancamentos'              => 'lancamentos#index'
      get    'lancamentos/:id'          => 'lancamentos#find' 
      post   'lancamentos'              => 'lancamentos#save'
      put    'lancamentos'              => 'lancamentos#update'
      delete 'lancamentos/:id'          => 'lancamentos#remove'
  	end
  end
end