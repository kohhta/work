
s1 = "[]"
s2 = "([])"
s3 = "(]"
s4 = "([)]"
s5 = "}{"

def solution(s)
  # スタックを初期化
  stack = []

  # 対応する括弧のペアをハッシュとして定義
  brackets = {
    ')' => '(',
    ']' => '[',
    '}' => '{'
  }

  # 文字列 s の各文字を1つずつ処理
  s.each_char do |char|
    # 開き括弧ならスタックに追加
    if brackets.values.include?(char)
      stack.push(char)
    # 閉じ括弧の場合
    elsif brackets.keys.include?(char)
      # 括弧のペアの開き括弧と stackに入れた直前のものを比較し、違ったらfalseでreturn
      unless stack.pop == brackets[char]
        return false
      end
    end
  end

  stack.empty?
end

puts solution(s1).inspect
puts solution(s2).inspect
puts solution(s3).inspect
puts solution(s4).inspect
puts solution(s5).inspect
