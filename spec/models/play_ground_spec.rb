require 'rails_helper'
require 'vcr'

RSpec.describe PlayGround, type: :model do
  it 'Googleの情報を取得し、get_google.ymlにデータを書き込む' do
    # VCRを使用したExample
    VCR.use_cassette("get_google") do
      100.times do
        response = Net::HTTP.get_response(URI('https://www.google.com'))
      end
    end
  end

  let(:play_ground) { FactoryBot.create(:play_ground) }

  it 'コートのバリデーションチェック' do
    expect(FactoryBot.build(:play_ground)).to be_valid
  end

  it 'FactoryBot内のコートネームが想定内のデータかどうか確認する' do
    expect(play_ground.court_name).to eq '代々木公園'
  end

end
