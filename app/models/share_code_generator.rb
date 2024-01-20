class ShareCodeGenerator

  CHARACTER_SET = %w[A C D E F G H J K M N P Q R T V W X Y Z].freeze

  def self.build
    new.build
  end

  def build
    (0...4).map { CHARACTER_SET[random_seed % CHARACTER_SET.size] }.join
  end

  def random_seed
    SecureRandom.random_number(4096)
  end
end
