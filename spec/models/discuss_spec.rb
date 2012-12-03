require 'spec_helper'

describe Discuss do
  it { should belong_to :user }
  it { should belong_to :news }

  it { should respond_to :comment }
  it { should respond_to :news_id }
  it { should respond_to :user_id }
end