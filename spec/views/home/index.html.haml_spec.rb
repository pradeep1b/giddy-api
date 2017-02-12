require 'rails_helper'
require 'spec_helper'

RSpec.describe 'home/index.html.haml', type: :view do
  it 'displays the home page' do
    render
    expect(rendered).to include('body')
  end
end
