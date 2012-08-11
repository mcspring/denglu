require 'spec_helper'

module Denglu

  describe Comment do
    before :each do
      @comment = Comment.new
    end

    context '.list' do
      it "should works" do
        result = @comment.list

        result.should be_instance_of(Array)
      end
    end

    context '.latest' do
      it "should works" do
        result = @comment.latest

        result.should be_instance_of(Array)
      end
    end

    context '.total' do
      it "should works" do
        result = @comment.total

        result.should be_instance_of(Array)
      end
    end
  end

end
