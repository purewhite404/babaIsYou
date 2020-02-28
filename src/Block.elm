module Block exposing (Block, dropBaba, move, takeBaba)


type alias Block =
    { x : Int, y : Int, name : String }



-- ブロックのリストからBABAと書かれたブロックだけ取り出す


takeBaba : List Block -> Maybe Block
takeBaba list =
    case list of
        b :: bs ->
            if b.name == "BABA" then
                Just b

            else
                takeBaba bs

        [] ->
            Nothing



-- ブロックのリストからBABAと書かれたブロックだけ除く


dropBaba : List Block -> List Block
dropBaba =
    dropBabaHelp []


dropBabaHelp : List Block -> List Block -> List Block
dropBabaHelp acc list =
    case list of
        b :: bs ->
            if b.name == "BABA" then
                acc ++ bs

            else
                dropBabaHelp (b :: acc) bs

        [] ->
            acc


move : Int -> Int -> Block -> Block
move dx dy block =
    { block | x = block.x + dx, y = block.y + dy }
