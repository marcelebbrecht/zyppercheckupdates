require 'spec_helper'
describe 'zypper' do
  context 'with default values for all parameters' do
    it { should contain_class('zypper') }
  end
end
