RSpec.describe 'A user can be able to post a feeling', type: :feature do
  before :each do
    User.create(username: 'user1', full_name: 'user one')
    visit access_login_path
    within('form') do
      fill_in 'username', with: 'user1'
    end
    click_button 'Log In'
    find('nav').click_link('Home')
  end

  it 'post a new feeling in the dashboard ' do
    visit access_dashboard_path
    find('.feeling') do
      fill_in 'feeling[text]', with: 'Today is a beautiful day'
    end
    click_button 'Post'
    expect(current_path).to eq(access_dashboard_path)
    expect(page).to have_content('Today is a beautiful day')
  end

  it 'prevents user from posting and empty feeling ' do
    visit access_dashboard_path
    find('.feeling') do
      fill_in 'feeling[text]', with: ''
    end
    expect { click_button 'Post' }.to change(Feeling, :count).by(0)
  end
end
