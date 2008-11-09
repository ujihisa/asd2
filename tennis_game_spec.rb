# -*- coding: utf-8 -*-
require 'rubygems'
require 'spec'
require 'tennis_game'

describe "Tennis Game" do
  describe "初期状態" do
    before do
      @game = TennisGame.new(6)
    end
    it "は、 0 - 0 (ラブオール) であること" do
      @game.score.should == [0, 0]
    end
  end
end
