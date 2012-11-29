require 'spec_helper'

describe News do
  it { should belong_to :user }
  it { should have_many :discusses }

  it { should respond_to :link }
  it { should respond_to :title }
end
