RSpec.describe 'Comments', type: :feature do
  before :each do
    User.create(username: 'user1', full_name: 'user one')
    visit access_login_path
    within('form') do
      fill_in 'username', with: 'user1'
    end
    click_button 'Log In'
    find('nav').click_link('Home')
  end

  it 'A signed in user can comment on a post ' do
    visit access_dashboard_path
      page.all(:css, '#comments-form').last() do
      fill_in 'Add new Comment', with: 'Awesome Post'
      expect { click_button 'Comment' }.to change(Comment, :count).by(1)
    end
  end
  
  it 'A comment cannot be empty ' do
    visit access_dashboard_path
      page.all(:css, '#comments-form').last() do
      fill_in 'Add new Comment', with: ''
      expect { click_button 'Comment' }.to change(Comment, :count).by(0)
    end
  end

end
