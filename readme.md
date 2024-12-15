# FlontLine

(勝手に想像した)医療用カルテアプリ

- Hospital（データ分割基準）
  - id
  - name
  - doctor_count
  - nurse_count
  - patient_count
- User

  - family_name
  - first_name
  - hospital_id
  - Doctor(カルテの作成・変更・削除ができる)

    - id
    - post（役職: 研修医、専門医）
    - years_of_experience（経験年数）

  - Nurse(普段のカルテを登録できる)
    - id
    - post（役職: 准看護師、看護師、師長）

- MedicalRecord

  - id
  - patient_id
  - writing_date
  - content

  MedicalRecord には自動下書き保存機能も実装する予定

- Patient(患者)

  - id
  - family_name
  - first_name
  - born_date（生年月日）
  - doctor_in_charge_id（担当医）
  - nurse_in_charge_id（担当看護師）

- Disease（病気）
  - id
  - patient_id
  - name

画面設計

- 登録画面 ... 新規病院とユーザーを同時に登録できる
- 患者一覧画面 ... その病院の患者一覧
- カルテ一覧 ... 該当患者のカルテ一覧
