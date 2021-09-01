## Lab 1 : CEG 3400

### Cryptography

Table of contents:
* [Background]()
* [Objectives]()
* [Preparation]()
* [Task 1: Hashing]()

---

#### Background

As mentioned in class, hashing and encryption capabilites are two of the most
significant tools available to sybersecurity professionals.  

---

#### Objectives

Students should become familiar with the following:

* hashing
* salt
* nonce
* symmetric encryption
* asymmetric encryption

---

#### Preparation

##### AWS

If you plan on using the AWS virtual space you will need to setup your AWS
Educate account and perform the following actions.

* From AWS Educate classroom access the CEG3400 course *AWS Console* (make sure
  you are signed in as a vocstartsoft user in the top right)
* Create an SSH public/private key pair for this course (`.pem` NOT putty!)
* Click [this cloudformation link](google.com) to deploy your stack
* Identify the IP address of the EC2 instance created [in the EC2
  page](google.com)
* Connect with the following string: `ssh -i /path/to/keyfile ubuntu@<IP
  ADDRESS>` 

  for example: `ssh -i /home/mkijowski/Downloads/ceg3400.pem
  ubuntu@123.245.246.247`

##### Required software

Needed sofware will be installed in AWS (hopefully) by default, if you are
using something else it is up to you to support it or use AWS.

Required software:


---

### Task 1: Hashing

In class we discussed hashing a single column in a table of data to preserve
privacy, but as we demonstrated a simple hash does little to preserve a students
privacy if we know a little about the what identifier might be being used.

I have provided the [`quiz-data.csv`](/data/quiz-data.csv) with all hashes
removed.  Provide a unique 5 character/digit  salt for each user and using `printf` and `sha256sum`
replace each secret identifier with a salted hashed value (include the salt as
the first 5 characters of your hash!).  Store this file in
the root of your repository with the name `salted-data.csv` and answer the
related questions in `README.md`.

* How many unique users are in the data?
* How many salts did you create?
* How many possible combinations will I need to try to figure out the secret ID
  of all students (assume I know all potential secret IDs)
* Instead of salts, if you were to use a nonce (unique number for each hashed
  field) how many possible combinations would I need to try?

BONUS (+1 quiz point): nonce and hash the secret ID (5 digit nonce) of each line, store the nonce beside the hash
like above.  Name the file `nonce-data.csv`.

### Task 2: Crypto Mine

My local cyber security hero Farmer Joe (fictional) created his own
cryptocurrency named Kentucky Fried Crypto (no relation to the restauraunt).

To earn KFC Coins you simply need to Hash a nonce and a word from the linux user
dictionary (typically `/usr/share/dict/american-english`) using `sha256sum` and
look for a number of leading `0`s.  More `0`s == more points.  For
example:`printf "4Beasley's" | sha256sum" gives a hash of
`00086d4b4f3d736a7dae792feb96377be57d8812ac0ae1e34d51d0f9eaf7a8b7` which would
be considered a 3 "point" coin since it begins with three `0`'s.

* nonces can be 2 or more digits
* words must come from an english dictionary and may include punctuation such as
  `'`
* **you may NOT submit any of the example nonce/word combos!**

Submit your mining code in the `/miner` folder and sumbit ** ONLY ONE** of the following:

* 3 different `000` point hashes with their respective nonce and word. For
  example:
  
  ```
  000c25558b4ac04450987eafd6bcf754572ef6ece08556b55e79f0a10d10d2ad  - - 23Australopithecus's
  000bfea597d0613077be94766a963ad8e8c11fc2aafd92fe770dcf5e19619315  - - 54Australian
  000e86ecc2b23dd1baff4044ed0780fffd83495933b168606f07ff7b60281d31  - - 101Accenture
  ```

OR

* A single `0000` point hash (because their worth more) with its respective
  nonce and word.  For example:
  
  ```
  00003704b9de4d3f71e9581f3501c041e690fc99c9f98e151c1f2f4978545893  - - 75Bridgeport's
  ```

BONUS (+1 quiz point): Submit a `00000` (5) point hash.



