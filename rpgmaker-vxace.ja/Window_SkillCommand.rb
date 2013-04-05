#
# スキル画面で、コマンド（特技や魔法など）を選択するウィンドウです。
#

class Window_SkillCommand < Window_Command
  #
  # 公開インスタンス変数
  #
  #
  attr_reader   :skill_window
  #
  # オブジェクト初期化
  #
  #
  def initialize(x, y)
    super(x, y)
    @actor = nil
  end
  #
  # ウィンドウ幅の取得
  #
  #
  def window_width
    return 160
  end
  #
  # アクターの設定
  #
  #
  def actor=(actor)
    return if @actor == actor
    @actor = actor
    refresh
    select_last
  end
  #
  # 表示行数の取得
  #
  #
  def visible_line_number
    return 4
  end
  #
  # コマンドリストの作成
  #
  #
  def make_command_list
    return unless @actor
    @actor.added_skill_types.sort.each do |stype_id|
      name = $data_system.skill_types[stype_id]
      add_command(name, :skill, true, stype_id)
    end
  end
  #
  # フレーム更新
  #
  #
  def update
    super
    @skill_window.stype_id = current_ext if @skill_window
  end
  #
  # スキルウィンドウの設定
  #
  #
  def skill_window=(skill_window)
    @skill_window = skill_window
    update
  end
  #
  # 前回の選択位置を復帰
  #
  #
  def select_last
    skill = @actor.last_skill.object
    if skill
      select_ext(skill.stype_id)
    else
      select(0)
    end
  end
end