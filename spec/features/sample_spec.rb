require 'spec_helper'
require 'capybara/rspec'

describe 'Shelf Chef App', type: :feature do
  it 'shows the homepage' do
    visit '/'
    expect(page).to have_content('Whats in your kitchen?')
    expect(page).to have_selector('form')
  end

  it 'redirects to homepage if no ingredients are entered' do
    visit '/recipies'
    expect(page).to have_current_path('/')
  end

  it 'shows a recipe when ingredients are entered', :vcr do
    visit '/'
    fill_in 'ingredients', with: 'eggs, cheese, spinach'
    click_button 'Find Recipie'
    expect(page).to have_content('Ingredients')
    expect(page).to have_content('Instructions')
  end
end
