class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title # 标题
      t.string :video_link #视频页地址, 给人看的,
      t.integer  :number # 第几集
      t.string :image # 图片路径
      t.string :translator # 译者名/翻译组织  如: @鸾爷 / @阿尔法字幕组
      t.timestamps null: false
      
      # 【10分钟速成课：哲学】第3集 - 如何论证：归纳与溯因
      # title 如何论证：归纳与溯因
      # number 3
    end
  end
end
