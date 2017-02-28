require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

  describe '#new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
    it 'assigns an idea instance variable' do
      get :new
      expect(assigns(:idea)).to be_a_new(Idea)
    end
  end

  describe '#create' do

    context 'with valid attributes' do

      def valid_request
        post :create, params: { idea: { title: 'test', description: 'quiz day! on monday!'} }
      end

      it 'create a new idea in the database' do
        count_before = Idea.count
        valid_request
        count_after = Idea.count
        expect(count_after).to eq(count_before + 1)
      end

      it 'redirects to the idea show page' do
        valid_request
        expect(response).to redirect_to(idea_path(Idea.last))
      end

    end

    context 'with invalid attributes' do
      def invalid_request
        post :create, params: { idea: { title: '' } }
      end

      it 'doesn\'t create a new idea in the database' do
        count_before = Idea.count
        invalid_request
        count_after = Idea.count
        expect(count_after).to eq(count_before)
      end

      it 'renders the new template' do
        invalid_request
        expect(response).to render_template(:new)
      end

    end

  end

end
