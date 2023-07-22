import chess.pgn
import pandas as pd

def pgn_to_dataframe(pgn_file):
    games = []
    
    with open(pgn_file) as f:
        while True:
            game = chess.pgn.read_game(f)
            if game is None:
                break
            
            moves = []
            board = game.board()
            
            for move in game.mainline_moves():
                moves.append(board.san(move))
                board.push(move)
                if len(moves) == 40:
                    break

            result = game.headers["Result"]
            moves.append(result)
            games.append(moves)

    column_names = [f"Ply {i+1}" for i in range(40)] + ["Result"]
    df = pd.DataFrame(games, columns=column_names)
    return df

pgn_file_path = "lichess_db_standard_rated_2016-02.1.1.pgn"
dataframe = pgn_to_dataframe(pgn_file_path)
print(dataframe)

dataframe.to_csv('data.csv', index=False)