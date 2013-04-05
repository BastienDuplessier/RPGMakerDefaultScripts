#
# タイマー表示用のスプライトです。$game_timer を監視し、スプライトの状態を
# 自動的に変化させます。
#

class Sprite_Timer < Sprite
  #
  # オブジェクト初期化
  #
  #
  def initialize(viewport)
    super(viewport)
    create_bitmap
    update
  end
  #
  # 解放
  #
  #
  def dispose
    self.bitmap.dispose
    super
  end
  #
  # ビットマップの作成
  #
  #
  def create_bitmap
    self.bitmap = Bitmap.new(96, 48)
    self.bitmap.font.size = 32
    self.bitmap.font.color.set(255, 255, 255)
  end
  #
  # フレーム更新
  #
  #
  def update
    super
    update_bitmap
    update_position
    update_visibility
  end
  #
  # 転送元ビットマップの更新
  #
  #
  def update_bitmap
    if $game_timer.sec != @total_sec
      @total_sec = $game_timer.sec
      redraw
    end
  end
  #
  # 再描画
  #
  #
  def redraw
    self.bitmap.clear
    self.bitmap.draw_text(self.bitmap.rect, timer_text, 1)
  end
  #
  # 描画用テキストの作成
  #
  #
  def timer_text
    sprintf("%02d:%02d", @total_sec / 60, @total_sec % 60)
  end
  #
  # 位置の更新
  #
  #
  def update_position
    self.x = Graphics.width - self.bitmap.width
    self.y = 0
    self.z = 200
  end
  #
  # 可視状態の更新
  #
  #
  def update_visibility
    self.visible = $game_timer.working?
  end
end