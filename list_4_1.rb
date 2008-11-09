# public void testMove()
# {
#   WumpusGame g = new WumpusGame();
#   g.connect(4,5,"E");
#   g.setPlayerRoom(4);
#   g.east();
#   assertEquals(5, g.getPlayerRoom());
# }
def test_move
  g = WumpusGame.new
  g.connect 4, 5, 'E'
  g.setPlayerRoom 4
  g.east
  assert_equal 5, g.get_player_room
end

=begin
  Java版、コンマのあとにスペースあったりなかったりで統一性がない感じ
=end
