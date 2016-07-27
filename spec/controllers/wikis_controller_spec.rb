require 'rails_helper'

RSpec.describe WikisController, type: :controller do
    
    let(:my_user) { User.create!(email: "jayaramraja1987@gmail.com", password: "123456", password_confirmation: "123456", confirmed_at: Time.now) }
    let(:my_wiki) { Wiki.create!(title: "jayaramraja1987", body: "ssssssssssssssssssssss", user: my_user) }

    before :each do
        sign_in my_user
    end
    
    describe "GET show" do
        it "returns http success" do
            get :show, {id: my_wiki.id}
            expect(response).to have_http_status(:success)
        end
     
        it "renders the #show view" do
            get :show, {id: my_wiki.id}
            expect(response).to render_template :show
        end
 
        it "assigns my_post to @wiki" do
            get :show, {id: my_wiki.id}
            expect(assigns(:wiki)).to eq(my_wiki)
        end
    end
    
    describe "GET new" do
        it "returns http success" do
            get :new
            expect(response).to have_http_status(:success)
        end
 
        it "renders the #new view" do
            get :new
            expect(response).to render_template :new
        end
 
        it "instantiates @wiki" do
            get :new
            expect(assigns(:wiki)).not_to be_nil
        end
    end
    
    describe "POST create" do
        it "increases the number of wiki by 1" do
            expect{post :create, wiki: {title: "aaaaaaaa", body: "asdfasdasdasdasdasd", private: false, user: my_user}}.to change(Wiki,:count).by(1)
        end
        
        it "assigns the new wiki to @wiki" do
            post :create, wiki: {title: "aaaaaaaa", body: "asdfasdasdasdasdasd", private: false, user: my_user}
            expect(assigns(:wiki)).to eq Wiki.last
        end
 
        it "redirects to the new wiki" do
            post :create, wiki: {title: "aaaaaaaa", body: "asdfasdasdasdasdasd", private: false, user: my_user}
            expect(response).to redirect_to Wiki.last
        end
    end
    
    describe "GET edit" do
        it "returns http success" do
            get :edit, {id: my_wiki.id}
            expect(response).to have_http_status(:success)
        end
 
        it "renders the #edit view" do
            get :edit, {id: my_wiki.id}
            expect(response).to render_template :edit
        end
 
        it "assigns wiki to be updated to @wiki" do
            get :edit, {id: my_wiki.id}
            expect(assigns(:wiki).id).to eq my_wiki.id
            expect(assigns(:wiki).title).to eq my_wiki.title
            expect(assigns(:wiki).body).to eq my_wiki.body
        end
    end
    
    describe "PUT update" do
        it "updates wiki with expected attributes" do
            new_title = "asdasdasdasd"
            new_body = "adsasddddddddddddddddddddd"
            put :update, id: my_wiki.id, wiki: {title: new_title, body: new_body, private: false, user: my_user }
            expect(assigns(:wiki).id).to eq my_wiki.id
            expect(assigns(:wiki).title).to eq new_title
            expect(assigns(:wiki).body).to eq new_body
        end
 
        it "redirects to the updated post" do
            new_title = "asdasdasdasd"
            new_body = "adsasddddddddddddddddddddd"
            put :update, id: my_wiki.id, wiki: {title: new_title, body: new_body, private: false, user: my_user }
            expect(response).to redirect_to my_wiki
        end
    end
    
    describe "DELETE destroy" do
        it "deletes the wiki" do
            delete :destroy, {id: my_wiki.id}
            count = Wiki.where({id: my_wiki.id}).size
            expect(count).to eq 0
        end
 
        it "redirects to homepage" do
            delete :destroy, {id: my_wiki.id}
            expect(response).to redirect_to root_path
        end
    end

end
