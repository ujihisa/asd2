# -*- coding: utf-8 -*-
require 'rubygems'
require 'spec'
require 'tennis_game'

describe "TennisGame::Game" do
  describe "初期状態" do
    before do
      @player1 = TennisGame::Player.new('a')
      @player2 = TennisGame::Player.new('b')
      @game = TennisGame::Game.new(@player1, @player2)
    end
    it "は、 0 - 0 (ラブオール) であること" do
      @game.raw_score.values.should == [0, 0]
    end
    it "は、勝者は未定であること" do
      @game.winner.should == nil
    end
  end
  describe "player1 が 1 ポイント取ったとき" do
    before do
      @player1 = TennisGame::Player.new('a')
      @player2 = TennisGame::Player.new('b')
      @game = TennisGame::Game.new(@player1, @player2)
      @game.add(@player1)
    end
    it "は、1 - 0 (15 - 0) であること" do
      @game.raw_score[@player1].should == 1
      @game.raw_score[@player2].should == 0
    end
    it "は、勝者は未定であること" do
      @game.winner.should == nil
    end
  end
  describe "player1 が 4 ポイント取ったとき" do
    before do
      @player1 = TennisGame::Player.new('a')
      @player2 = TennisGame::Player.new('b')
      @game = TennisGame::Game.new(@player1, @player2)
      4.times{ @game.add(@player1) }
    end
    it "は、 4 - 0 であること" do
      @game.raw_score[@player1].should == 4
      @game.raw_score[@player2].should == 0
    end
    it "は、player1 がこのゲームの勝者であること" do
      @game.winner.should == @player1
    end
  end
  describe "player2 が 4 ポイント取ったとき" do
    before do
      @player1 = TennisGame::Player.new('a')
      @player2 = TennisGame::Player.new('b')
      @game = TennisGame::Game.new(@player1, @player2)
      4.times{ @game.add(@player2) }
    end
    it "は、 0 - 4 であること" do
      @game.raw_score[@player1].should == 0
      @game.raw_score[@player2].should == 4
    end
    it "は、player2 がこのゲームの勝者であること" do
      @game.winner.should == @player2
    end
  end
  describe "player1 と player2 が 4 ポイントずつ取ったとき" do
    before do
      @player1 = TennisGame::Player.new('a')
      @player2 = TennisGame::Player.new('b')
      @game = TennisGame::Game.new(@player1, @player2)
      4.times{
        @game.add(@player1)
        @game.add(@player2)
      }
    end
    it "は、ジュースであること" do
      @game.score.should == :duce
    end
    it "は、勝者は未定であること" do
      @game.winner.should == nil
    end
  end
end
