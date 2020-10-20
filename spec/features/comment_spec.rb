RSpec.describe 'A user can be able to post a feeling', type: :feature do
  before :each do
    User.create(name: 'user1', full_name: 'user one')
    visit access_login_path
    within('form') do
      fill_in 'username', with: 'user1'
    end
    click_button 'Log In'
    find('nav').click_link('Home')
  end

  it 'post a new feeling' do
    visit access_dashboard_path
    within('Body') do
      fill_in 'Post a feeling', with: 'Today is a beautiful day'
    end
    click_button 'Post'
    expect(current_path).to eq(access_dashboard_path)
    expect(page).to have_content('This is a post one')
  end
end
