users

|  column  |
| ---- |
|  id  |
| name  |
 |email  |
 |  password_digest  |


tasks

|  column |
| ---- |
|  id  |  
|task_name |
| content  |
|  user_id  |


labels

|  column |
| ---- |
|  id  |
| label_name |
|content  |
|user_id  |
|task_id  |

# デプロイの手順について
1. *Herokuへのログイン*
2. *アセットプリコンパイルをする*
3. *コミットする*
4. *Herokuに新しいアプリケーションを作成する*
5. *Heroku buildpackを追加する*
6. *Herokuにデプロイをする*
7. *データベースの移行をする*
8. *アプリケーションにアクセスする*
