require 'spec_helper'

describe 'ServerList' do
  before :all do
    @api = WrataApi::WrataApi.new
    @free_pcs = @api.free_servers(5)
  end

  it 'api.free_servers(5) object' do
    expect(@free_pcs).to be_a(WrataApi::ServerList)
  end

  it 'api.free_servers(5) count' do
    expect(@free_pcs.length).to eq(5)
  end

  it 'ServerList poweron' do
    @free_pcs.power_on
    expect(@free_pcs).to be_powered_on
  end

  it 'ServerList book' do
    @free_pcs.book
  end

  it 'ServerList unbook' do
    @free_pcs.unbook
  end

  it 'ServerList poweroff' do
    @free_pcs.power_off
    expect(@free_pcs).to be_powered_off
  end

  it 'Try to get free servers in great count' do
    expect { @api.free_servers(1000) }
      .to raise_error(WrataApi::NotEnoughServerCount)
  end
end
