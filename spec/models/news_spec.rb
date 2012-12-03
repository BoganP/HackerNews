require 'spec_helper'

describe News do
  it { should belong_to :user }
  it { should have_many :discusses }

  it { should respond_to :link }
  it { should respond_to :title }
  it { should respond_to :user_id}
  it { should respond_to :score}
  it { should respond_to :ups}
  it { should respond_to :downs}
  
  describe '#inc_up' do
    before do
      @user = User.create(email: 'foo@foo.com')
    end
    
    it 'should return 1' do
      subject.ups = []
      subject.inc_up(@user).should == 1
    end
    
    it 'should return if same user was in the same array' do
      subject.ups = []
      subject.inc_up(@user).should == 1
      subject.inc_up(@user).should == 1
    end
    
  end
  describe '#inc_down' do
    before do
      @user = User.create(email: 'foo@foo.com')
    end
    
    it 'should return 1' do
      subject.downs = []
      subject.inc_down(@user).should == 1
    end
    
    it 'should return if same user was in the same array' do
      subject.downs = []
      subject.inc_down(@user).should == 1
      subject.inc_down(@user).should == 1
    end
    
  end
  
  describe '#calc_score' do
    before do
      @user = User.create(email: 'foo@foo.com')
    end
    
    it 'should return 0' do
      subject.calc_score.should == 0
    end
    it 'should return 1' do
      subject.inc_up(@user).should == 1
      subject.calc_score.should == 1    
    end
    it 'should return 1' do
      subject.inc_up(@user).should == 1
      subject.inc_down(@user).should == 0
      subject.calc_score.should == 1
    end
  end
end
