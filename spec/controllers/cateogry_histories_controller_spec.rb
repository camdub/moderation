require 'spec_helper'

describe CategoryHistoriesController do

  describe 'GET index' do
    it 'assigns the current categories' do
      get :index
      expect(assigns(:restricted)).to eq('meat')
    end

    it 'renders the index template' do
      get :index
      response.should render_template :index
    end
  end

end