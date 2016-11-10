require 'spec_helper'

describe 'gitlabmultirunner' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "gitlabmultirunner class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('gitlabmultirunner::params') }
          it { is_expected.to contain_class('gitlabmultirunner::install').that_comes_before('gitlabmultirunner::config') }
          it { is_expected.to contain_class('gitlabmultirunner::config') }
          it { is_expected.to contain_class('gitlabmultirunner::service').that_subscribes_to('gitlabmultirunner::config') }

          it { is_expected.to contain_service('gitlab-runner') }
          it { is_expected.to contain_package('gitlab-ci-multi-runner').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'gitlabmultirunner class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('gitlabmultirunner') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
