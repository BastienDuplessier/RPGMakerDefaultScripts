#encoding:utf-8
#
# 顯示物品使用或技能使用的選擇目的的視窗
#

class Window_MenuActor < Window_MenuStatus
  #
  # 初始化物件
  #
  #
  def initialize
    super(0, 0)
    self.visible = false
  end
  #
  # 按下確定鍵時的處理
  #
  #
  def process_ok
    $game_party.target_actor = $game_party.members[index] unless @cursor_all
    call_ok_handler
  end
  #
  # 返回上一個選擇的位置
  #
  #
  def select_last
    select($game_party.target_actor.index || 0)
  end
  #
  # 設定游標的選擇位置／範圍
  #
  #
  def select_for_item(item)
    @cursor_fix = item.for_user?
    @cursor_all = item.for_all?
    if @cursor_fix
      select($game_party.menu_actor.index)
    elsif @cursor_all
      select(0)
    else
      select_last
    end
  end
end
