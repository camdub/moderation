require 'spec_helper'

describe CategoryHistoriesController do

  describe 'GET new' do
    it 'assigns the current categories' do
      get :index
      expect(assigns(:restricted)).to eq('meat')
    end
  end

end