require 'spec_helper'
describe 'zyppercheckupdates' do
  context 'with default values for all parameters' do
    it { should contain_class('zyppercheckupdates') }
  end
end
