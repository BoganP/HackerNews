require 'spec_helper'

describe User do
  it { should have_many :news }
  it { should have_many :discusses }

  it { should respond_to :email }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should respond_to :remember_me }

end