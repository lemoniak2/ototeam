require 'spec_helper'

describe GroupCreator do
  subject{described_class.new(controller)}
  describe '#save' do
    context 'group is valid' do
      let(:creator){ create(:user) }
      let(:controller){ double(group: build(:group, creator: creator)) }
      it{ expect{subject.save}.to change {Group.count}.by(1) }

      #context 'creator has 2 friends' do
        #before { create_list(:friend, 2,  creator: creator)}
   #context 'after perform' do
     #before { subject.save}

   #end
        end
    #end

  end





end
