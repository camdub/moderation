require 'spec_helper'

describe CategoryHistoriesController do

  let!(:restricted_history) { create(:restricted_history) }
  let!(:limited_history) { create(:limited_history) }

  describe 'GET index' do
    it 'assigns the current categories' do
      get :index
      expect(assigns(:restricted)).to eq(restricted_history.category.name)
      expect(assigns(:limited)).to eq(limited_history.category.name)
    end

    it 'renders the index template' do
      get :index
      response.should render_template :index
    end
  end

end