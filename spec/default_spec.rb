require 'chefspec'

describe 'nullmailer::default' do
  let(:chef_runner) { ChefSpec::ChefRunner.new(
      evaluate_guards: true, log_level: :error,
      platform: 'ubuntu', version: '12.04') }
  let(:chef_run) { chef_runner.converge 'nullmailer::default' }

  it 'should install distribution package' do
    expect(chef_run).to install_package('nullmailer')
  end

  it 'should setup nullmailer service' do
    expect(chef_run).to start_service 'nullmailer'
    expect(chef_run).to set_service_to_start_on_boot 'nullmailer'
  end

  context 'mailname file' do
    it 'should set it to the host fqdn by default' do
      expect(chef_run).to create_file '/etc/mailname'
      expect(chef_run).to create_file_with_content '/etc/mailname', 'fauxhai.local'
    end

    it 'should to override able value' do
      chef_runner.node.set['nullmailer']['mailname'] = 'chefspec.example.org'
      expect(chef_run).to create_file '/etc/mailname'
      expect(chef_run).to create_file_with_content '/etc/mailname', 'chefspec.example.org'
    end

    it 'configuration can be disabled' do
      chef_runner.node.set['nullmailer']['configure']['mailname'] = false
      expect(chef_run).to_not create_file '/etc/mailname'
    end
  end

  context 'adminaddr control file' do
    let(:adminaddr_file) { '/etc/nullmailer/adminaddr' }
    it 'should not manage this file by default' do
      expect(chef_run).to_not create_file adminaddr_file
    end

    it 'should be created on empty string' do
      chef_runner.node.set['nullmailer']['adminaddr'] = ''
      expect(chef_run).to create_file adminaddr_file
      expect(chef_run).to create_file_with_content adminaddr_file, ''
    end

    it 'should be setable to e-Mail addresses' do
      chef_runner.node.set['nullmailer']['adminaddr'] = 'admin@example.org'
      expect(chef_run).to create_file adminaddr_file
      expect(chef_run).to create_file_with_content adminaddr_file, 'admin@example.org'
    end
  end

  context 'defaulthost control file' do
    let(:defaulthost_file) { '/etc/nullmailer/defaulthost' }
    it 'should not manage this file by default' do
      expect(chef_run).to_not create_file defaulthost_file
    end

    it 'should be created on empty string' do
      chef_runner.node.set['nullmailer']['defaulthost'] = ''
      expect(chef_run).to create_file defaulthost_file
      expect(chef_run).to create_file_with_content defaulthost_file, ''
    end

    it 'should be setable to host names' do
      chef_runner.node.set['nullmailer']['defaulthost'] = 'chefspec.example.org'
      expect(chef_run).to create_file defaulthost_file
      expect(chef_run).to create_file_with_content defaulthost_file, 'chefspec.example.org'
    end
  end

  context 'idhost control file' do
    let(:idhost_file) { '/etc/nullmailer/idhost' }
    it 'should not manage this file by default' do
      expect(chef_run).to_not create_file idhost_file
    end

    it 'should be created on empty string' do
      chef_runner.node.set['nullmailer']['idhost'] = ''
      expect(chef_run).to create_file idhost_file
      expect(chef_run).to create_file_with_content idhost_file, ''
    end

    it 'should be setable to host names' do
      chef_runner.node.set['nullmailer']['idhost'] = 'chefspec.example.org'
      expect(chef_run).to create_file idhost_file
      expect(chef_run).to create_file_with_content idhost_file, 'chefspec.example.org'
    end
  end

  context 'defaultdomain control file' do
    let(:defaultdomain_file) { '/etc/nullmailer/defaultdomain' }
    it 'should not manage this file by default' do
      expect(chef_run).to_not create_file defaultdomain_file
    end

    it 'should be created on empty string' do
      chef_runner.node.set['nullmailer']['defaultdomain'] = ''
      expect(chef_run).to create_file defaultdomain_file
      expect(chef_run).to create_file_with_content defaultdomain_file, ''
    end

    it 'should be setable to domain names' do
      chef_runner.node.set['nullmailer']['defaultdomain'] = 'example.org'
      expect(chef_run).to create_file defaultdomain_file
      expect(chef_run).to create_file_with_content defaultdomain_file, 'example.org'
    end
  end

  context 'helohost control file' do
    let(:helohost_file) { '/etc/nullmailer/helohost' }
    it 'should not manage this file by default' do
      expect(chef_run).to_not create_file helohost_file
    end

    it 'should be created on empty string' do
      chef_runner.node.set['nullmailer']['helohost'] = ''
      expect(chef_run).to create_file helohost_file
      expect(chef_run).to create_file_with_content helohost_file, ''
    end

    it 'should be setable to host names' do
      chef_runner.node.set['nullmailer']['helohost'] = 'chefspec.example.org'
      expect(chef_run).to create_file helohost_file
      expect(chef_run).to create_file_with_content helohost_file, 'chefspec.example.org'
    end
  end

  context 'pausetime' do
    let(:pausetime_file) { '/etc/nullmailer/pausetime' }
    it 'should not manage this file by default' do
      expect(chef_run).to_not create_file pausetime_file
    end

    it 'should be created on empty string' do
      chef_runner.node.set['nullmailer']['pausetime'] = ''
      expect(chef_run).to create_file pausetime_file
      expect(chef_run).to create_file_with_content pausetime_file, ''
    end

    it 'should be setable to numbers' do
      chef_runner.node.set['nullmailer']['pausetime'] = 600
      expect(chef_run).to create_file pausetime_file
      expect(chef_run).to create_file_with_content pausetime_file, '600'
    end
  end

  context 'sendtimeout' do
    let(:sendtimeout_file) { '/etc/nullmailer/sendtimeout' }
    it 'should not manage this file by default' do
      expect(chef_run).to_not create_file sendtimeout_file
    end

    it 'should be created on empty string' do
      chef_runner.node.set['nullmailer']['sendtimeout'] = ''
      expect(chef_run).to create_file sendtimeout_file
      expect(chef_run).to create_file_with_content sendtimeout_file, ''
    end

    it 'should be setable to numbers' do
      chef_runner.node.set['nullmailer']['sendtimeout'] = 600
      expect(chef_run).to create_file sendtimeout_file
      expect(chef_run).to create_file_with_content sendtimeout_file, '600'
    end
  end

  context 'relayhost' do
    let(:remotes_file) { '/etc/nullmailer/remotes' }
    it 'should be default to mail.domain with smtp' do
      expect(chef_run).to create_file remotes_file
      expect(chef_run).to create_file_with_content remotes_file, 'mail.local smtp'
    end

    it 'proto should be configurable' do
      chef_runner.node.set['nullmailer']['relay_proto'] = 'qmqp'
      expect(chef_run).to create_file_with_content remotes_file, 'mail.local qmqp'
    end

    it 'should support passing additional flag arguments' do
      chef_runner.node.set['nullmailer']['relay_options']['starttls'] = true
      expect(chef_run).to create_file_with_content remotes_file, 'mail.local smtp --starttls'
    end

    it 'should support passing remove previously setted additional flag arguments' do
      chef_runner.node.set['nullmailer']['relay_options']['starttls'] = false
      expect(chef_run).to create_file_with_content remotes_file, /^mail\.local smtp$/
    end

    it 'should support passing arguments with value' do
      chef_runner.node.set['nullmailer']['relay_options']['user'] = 'hans'
      expect(chef_run).to create_file_with_content remotes_file, 'mail.local smtp --user=hans'
    end

    it 'should support passing arguments with integer value' do
      chef_runner.node.set['nullmailer']['relay_options']['port'] = 2525
      expect(chef_run).to create_file_with_content remotes_file, 'mail.local smtp --port=2525'
    end

    it 'configuration can be disabled' do
      chef_runner.node.set['nullmailer']['configure']['remotes'] = false
      expect(chef_run).to_not create_file remotes_file
    end

    it 'should secure the remotes file cause passwords' do
      expect(chef_run.file(remotes_file)).to be_owned_by('mail', 'mail')
      expect(chef_run.file(remotes_file).mode).to eq(00600)
    end
  end
end
