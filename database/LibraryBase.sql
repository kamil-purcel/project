-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 15, 2023 at 12:58 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `LibraryBase`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `isbn` varchar(13) NOT NULL,
  `title` varchar(250) NOT NULL,
  `authors` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `published_date` date NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`isbn`, `title`, `authors`, `publisher`, `published_date`, `category`, `pages`, `image`, `description`) VALUES
('9789391019310', 'VUCA in Start-ups', 'Dr. Aseem Chauhan, Prof. (Dr.) Manoj Joshi, Prof. (Dr.) Ashok Kumar & Suhayl Abidi', 'Jaico Publishing House', '2021-12-25', 'maths', 300, '0000001.jpg', 'Książka przedstawia ponad 60 najbardziej znanych w Polsce gatunków zwierząt. Oprócz informacji o występowaniu danego gatunku, jego cechach i trybie życia znajdziesz tu również ciekawostki oraz mnóstwo zdjęć. Dzięki atlasowi rozpoznasz m.in. żbika, sarnę, popielicę czy kumaka.'),
('9789391030070', 'Python Data Visualization Essentials Guide', 'Kallur Rahman', 'BPB Publications', '2021-07-30', 'python', 383, '0000002.jpg', NULL),
('9789391030087', 'Business Intelligence Demystified', 'Anoop Kumar V K', 'BPB Publications', '2021-09-25', 'maths', 312, '0000003.jpg', NULL),
('9789391030353', 'Essentials of Deep Learning and AI', 'Shashidhar Soppin, Dr. Manjunath Ramachandra, B N Chandrashekar', 'BPB Publications', '2021-11-25', 'deep learning', 394, '0000004.jpg', NULL),
('9789391030889', 'Hands-On Julia Programming', 'Sambit Kumar Dash', 'BPB Publications', '2021-10-21', 'data science', 388, '0000005.jpg', NULL),
('9789391184735', 'CBSE Final Revision Guide for subjects: Term I Class 10 2021 Examination', 'Oswal - Gurukul', 'Oswal Publishers', '2021-10-26', 'maths', 366, '0000006.jpg', NULL),
('9789391392284', 'Data Processing and Modeling with Hadoop', 'Vinicius Aquino do Vale', 'BPB Publications', '2021-10-12', 'Business Analytics', 198, '0000007.jpg', NULL),
('9789391392611', 'Learn AI with Python', 'Gaurav Leekha', 'BPB Publications', '2021-10-19', 'deep learning', 270, '0000008.jpg', NULL),
('9789391392871', 'Practitionerâ€™s Guide to Data Science', 'Nasir Ali Mirza', 'BPB Publications', '2022-01-17', 'data science', 242, '0000009.jpg', NULL),
('9789391760007', 'Campus Plus 2022', 'Infokerala Communications Pvt Ltd', 'Infokerala Communications Pvt Ltd', '2022-07-11', 'maths', 276, '0000010.jpg', NULL),
('9789394304222', 'DATA SCIENCE', 'Dr.Venkataramana Sarella, Mr. Sandeep Srivastava, Dr.K.Jamberi, Dr.Syed Khasim ', 'GCS PUBLISHERS', '2022-05-01', 'data science', 288, '0000011.jpg', NULL),
('9789400765641', 'The Laws of Robots', 'Ugo Pagallo', 'Springer Science & Business Media', '2013-05-16', 'Data ethics', 481, '0000012.jpg', NULL),
('9789400774704', 'Linking Ecology and Ethics for a Changing World', 'Ricardo Rozzi, S.T.A. Pickett, Clare Palmer, Juan J. Armesto, J. Baird Callicott', 'Springer Science & Business Media', '2014-02-06', 'Data ethics', 242, '0000013.jpg', NULL),
('9789402421118', 'Leadership and Business Ethics', 'Gabriel Flynn', 'Springer Nature', '2022-01-24', 'Data ethics', 224, '0000014.jpg', NULL),
('9789463004381', 'The Best Available Evidence', 'Paul Newton, David Burgess', 'Springer', '2016-07-15', 'Data ethics', 497, '0000015.jpg', NULL),
('9789463722902', 'Data Visualization in Society', 'Martin Engebretsen, Helen Kennedy', 'Amsterdam University Press', '2020-03-21', 'visualization', 581, '0000016.jpg', NULL),
('9789526074481', 'Data Visualization Handbook', 'Juuso Koponen, Jonatan HildĂ©n', 'Aalto korkeakoulusĂ¤Ă¤tiĂ¶', '2019-04-01', 'visualization', 448, '0000017.jpg', NULL),
('9789535108528', 'Theory and Applications for Advanced Text Mining', 'Shigeaki Sakurai', 'BoD â€“ Books on Demand', '2012-11-21', 'data science', 230, '0000018.jpg', NULL),
('9789587921465', 'Machine Learning y Deep Learning', 'JesĂşs Bobadilla', 'Ediciones de la U', '2021-06-04', 'deep learning', 292, '0000019.jpg', NULL),
('9789612549848', 'Airborne laser scanning raster data visualization', 'Ĺ˝iga Kokalj, Ralf Hesse', 'ZaloĹľba ZRC', '2017-03-15', 'visualization', 385, '0000020.jpg', NULL),
('9789811019098', 'The WordNet in Indian Languages', 'Niladri Sekhar Dash, Pushpak Bhattacharyya, Jyoti D. Pawar', 'Springer', '2016-10-20', 'NLP', 201, '0000021.jpg', NULL),
('9789811025945', 'Advanced Statistical Methods in Data Science', 'Ding-Geng Chen, Jiahua Chen, Xuewen Lu, Grace Y. Yi, Hao Yu', 'Springer', '2016-11-30', 'statistics', 102, '0000022.jpg', NULL),
('9789811052095', 'Deep Learning in Natural Language Processing', 'Li Deng, Yang Liu', 'Springer', '2018-05-23', 'NLP', 336, '0000023.jpg', NULL),
('9789811054488', 'STEM Education in the Junior Secondary', 'Robyn Jorgensen, Kevin Larkin', 'Springer', '2017-08-09', 'maths', 294, '0000024.jpg', NULL),
('9789811064302', 'Computational Intelligence, Communications, and Business Analytics', 'J. K. Mandal, Paramartha Dutta, Somnath Mukhopadhyay', 'Springer', '2017-10-01', 'Business Analytics', 631, '0000025.jpg', NULL),
('9789811066801', 'Knowledge Computing and Its Applications', 'S. Margret Anouncia, Uffe Kock Wiil', 'Springer', '2018-02-15', 'deep learning', 293, '0000026.jpg', NULL),
('9789811068089', 'Machine Learning with R', 'Abhijit Ghatak', 'Springer', '2017-11-23', '', 240, '0000027.jpg', NULL),
('9789811085277', 'Data Science and Analytics', 'Brajendra Panda, Sudeep Sharma, Nihar Ranjan Roy', 'Springer', '2018-03-07', 'statistics', 201, '0000028.jpg', NULL),
('9789811201240', 'Principles Of Artificial Neural Networks: Basic Designs To Deep Learning (4th Edition)', 'Graupe Daniel', 'World Scientific', '2019-03-15', 'deep learning', 440, '0000029.jpg', NULL),
('9789811218859', 'Generalization With Deep Learning: For Improvement On Sensing Capability', 'Zhenghua Chen, Min Wu, Xiaoli Li', 'World Scientific', '2021-04-07', 'deep learning', 324, '0000030.jpg', NULL),
('9789811219177', 'Cybersecurity And Legal-regulatory Aspects', 'Gabi Siboni, Limor Ezioni', 'World Scientific', '2021-01-04', 'Data ethics', 282, '0000031.jpg', NULL),
('9789811228162', 'Machine Learning: Concepts, Tools And Data Visualization', 'Minsoo Kang, Eunsoo Choi', 'World Scientific', '2021-03-16', 'visualization', 432, '0000032.jpg', NULL),
('9789811251825', 'Adventures In Financial Data Science: The Empirical Properties Of Financial And Economic Data (Second Edition)', 'Graham L Giller', 'World Scientific', '2022-06-27', 'maths', 512, '0000033.jpg', NULL),
('9789811312083', 'Advances in Analytics and Applications', 'Arnab Kumar Laha', 'Springer', '2018-09-07', 'Business Analytics', 297, '0000034.jpg', NULL),
('9789811313349', 'Understanding the Role of Business Analytics', 'Hardeep Chahal, Jeevan Jyoti, Jochen Wirtz', 'Springer', '2018-09-14', 'Business Analytics', 205, '0000035.jpg', NULL),
('9789811315169', 'Cognitively Inspired Natural Language Processing', 'Abhijit Mishra, Pushpak Bhattacharyya', 'Springer', '2018-08-01', 'NLP', 232, '0000036.jpg', NULL),
('9789811315800', 'First International Conference on Artificial Intelligence and Cognitive Computing', 'Raju Surampudi Bapi, Koppula Srinivas Rao, Munaga V. N. K. Prasad', 'Springer', '2018-11-04', 'data science', 716, '0000037.jpg', NULL),
('9789811358500', 'Deep Learning with R', 'Abhijit Ghatak', 'Springer', '2019-04-13', 'deep learning', 245, '0000038.jpg', NULL),
('9789811361753', 'Artificial Intelligence Accelerates Human Learning', 'Katashi Nagao', 'Springer', '2019-02-02', 'NLP', 317, '0000039.jpg', NULL),
('9789811366819', 'Shaping the Future of Education, Communication and Technology', 'Will W. K. Ma, Wendy Wing Lam Chan, Cat Miaoting Cheng', 'Springer', '2019-04-30', 'deep learning', 249, '0000040.jpg', NULL),
('9789811367946', 'Advances in Deep Learning', 'M. Arif Wani, Farooq Ahmad Bhat, Saduf Afzal, Asif Iqbal Khan', 'Springer', '2019-03-14', 'deep learning', 149, '0000041.jpg', NULL),
('9789811374746', 'Visual and Text Sentiment Analysis through Hierarchical Deep Learning Networks', 'Arindam Chaudhuri', 'Springer', '2019-04-06', 'deep learning', 98, '0000042.jpg', NULL),
('9789811375644', 'Proceedings of International Joint Conference on Computational Intelligence', 'Mohammad Shorif Uddin, Jagdish Chand Bansal', 'Springer', '2019-07-03', 'NLP', 504, '0000043.jpg', NULL),
('9789811385780', 'Computational Intelligence, Communications, and Business Analytics', 'Jyotsna Kumar Mandal, Somnath Mukhopadhyay, Paramartha Dutta, Kousik Dasgupta', 'Springer', '2019-06-24', 'Business Analytics', 493, '0000044.jpg', NULL),
('9789811490514', 'Predictive Analytics Using Statistics and Big Data: Concepts and Modeling', 'Krishna Kumar Mohbey, Arvind Pandey, Dharmendra Singh Rajput', 'Bentham Science Publishers', '2020-12-09', 'statistics', 137, '0000045.jpg', NULL),
('9789811500299', 'First International Conference on Sustainable Technologies for Computational Intelligence', 'Ashish Kumar Luhach, Janos Arpad Kosa, Ramesh Chandra Poonia, Xiao-Zhi Gao, Dharm Singh', 'Springer Nature', '2019-11-01', 'NLP', 1579, '0000046.jpg', NULL),
('9789811505959', 'Speech-to-Speech Translation', 'Yutaka Kidawara, Eiichiro Sumita, Hisashi Kawai', 'Springer Nature', '2019-11-22', 'NLP', 436, '0000047.jpg', NULL),
('9789811512162', 'Deep Learning-Based Approaches for Sentiment Analysis', 'Basant Agarwal, Richi Nayak, Namita Mittal, Srikanta Patnaik', 'Springer Nature', '2020-01-24', 'deep learning', 319, '0000048.jpg', NULL),
('9789811517358', 'Statistics for Data Science and Policy Analysis', 'Azizur Rahman', 'Springer Nature', '2020-03-31', 'statistics', 412, '0000049.jpg', NULL),
('9789811519604', 'Statistics and Data Science', 'Hien Nguyen', 'Springer Nature', '2020-01-03', 'statistics', 348, '0000050.jpg', NULL),
('9789811520358', 'Quantitative Economics with R', 'Vikram Dayal', 'Springer Nature', '2020-02-03', '', 651, '0000051.jpg', NULL),
('9789811522826', 'Data Visualization', 'S. Margret Anouncia, Hardik A. Gohel, Subbiah Vairamuthu', 'Springer Nature', '2020-03-03', 'visualization', 704, '0000052.jpg', NULL),
('9789811525520', 'Statistical Data Analysis and Entropy', 'Nobuoki Eshima', 'Springer Nature', '2020-01-21', 'statistics', 405, '0000053.jpg', NULL),
('9789811533570', 'Applications of Machine Learning', 'Prashant Johri, Jitendra Kumar Verma, Sudip Paul', 'Springer Nature', '2020-05-04', 'visualization', 138, '0000054.jpg', NULL),
('9789811536472', 'Strategic System Assurance and Business Analytics', 'P. K. Kapur, Ompal Singh, Sunil Kumar Khatri, Ajit Kumar Verma', 'Springer Nature', '2020-06-19', 'Business Analytics', 602, '0000055.jpg', NULL),
('9789811544743', 'Data Science and Intelligent Applications', 'Ketan Kotecha, Vincenzo Piuri, Hetalkumar N. Shah, Rajan Patel', 'Springer Nature', '2020-06-17', 'data science', 576, '0000056.jpg', NULL),
('9789811555732', 'Representation Learning for Natural Language Processing', 'Zhiyuan Liu, Yankai Lin, Maosong Sun', 'Springer Nature', '2020-07-03', 'NLP', 504, '0000057.jpg', NULL),
('9789811561337', 'Data Science Concepts and Techniques with Applications', 'Usman Qamar, Muhammad Summair Raza', 'Springer Nature', '2020-06-08', 'data science', 196, '0000058.jpg', NULL),
('9789811563218', 'Deep Learning for Cancer Diagnosis', 'Utku Kose, Jafar Alzubi', 'Springer Nature', '2020-09-12', 'deep learning', 300, '0000059.jpg', NULL),
('9789811578779', 'Statistical Learning with Math and Python', 'Joe Suzuki', 'Springer Nature', '2021-08-03', 'maths', 261, '0000060.jpg', NULL),
('9789811579844', 'Data Science', 'Pinle Qin, Hongzhi Wang, Guanglu Sun, Zeguang Lu', 'Springer Nature', '2020-08-20', 'data science', 652, '0000061.jpg', NULL),
('9789811602894', 'Machine Learning, Deep Learning and Computational Intelligence for Wireless Communication', 'E. S. Gopi', 'Springer Nature', '2021-05-28', 'NLP', 1312, '0000062.jpg', NULL),
('9789811617737', 'Smart Technologies in Data Science and Communication', 'Sanjoy Kumar Saha, Paul S. Pang, Debnath Bhattacharyya', 'Springer Nature', '2021-06-07', 'data science', 398, '0000063.jpg', NULL),
('9789811619199', 'Data Science and SDGs', 'Bikas Kumar Sinha, Md. Nurul Haque Mollah', 'Springer Nature', '2021-08-13', 'statistics', 287, '0000064.jpg', NULL),
('9789811627866', 'Impact of AI and Data Science in Response to Coronavirus Pandemic', 'Sushruta Mishra, Pradeep Kumar Mallick, Hrudaya Kumar Tripathy, Gyoo-Soo Chae, Bhabani Shankar Prasa', 'Springer Nature', '2021-07-22', 'statistics', 300, '0000065.jpg', NULL),
('9789811630712', 'International Conference on Innovative Computing and Communications', 'Ashish Khanna, Deepak Gupta, Siddhartha Bhattacharyya, Aboul Ella Hassanien, Sameer Anand, Ajay Jais', 'Springer Nature', '2021-08-28', 'maths', 893, '0000066.jpg', NULL),
('9789811631801', '3D Imaging Technologiesâ€”Multidimensional Signal Processing and Deep Learning', 'Lakhmi C. Jain, Roumen Kountchev, Yonghang Tai', 'Springer Nature', '2021-08-29', 'NLP', 643, '0000067.jpg', NULL),
('9789811644863', 'Data Science and Security', 'Samiksha Shukla, Aynur Unal, Joseph Varghese Kureethara, Durgesh Kumar Mishra, Dong Seog Han', 'Springer Nature', '2021-08-26', 'data science', 489, '0000068.jpg', NULL),
('9789811663284', 'Proceedings of 2021 Chinese Intelligent Systems Conference', 'Yingmin Jia, Weicun Zhang, Yongling Fu, Zhiyuan Yu, Song Zheng', 'Springer Nature', '2021-10-07', 'NLP', 243, '0000069.jpg', NULL),
('9789811673344', 'Soft Computing in Data Science', 'Azlinah Mohamed, Bee Wah Yap, Jasni Mohamad Zain, Michael W. Berry', 'Springer Nature', '2021-10-28', 'data science', 440, '0000070.jpg', NULL),
('9789811685156', 'Proceedings of the 8th International Conference on Computational Science and Technology', 'Rayner Alfred, Yuto Lim', 'Springer Nature', '2022-03-25', 'maths', 905, '0000071.jpg', NULL),
('9789811699955', 'Information Retrieval and Natural Language Processing', 'Sheetal S. Sonawane, Parikshit N. Mahalle, Archana S. Ghotkar', 'Springer Nature', '2022-04-05', 'NLP', 508, '0000072.jpg', NULL),
('9789811910401', 'Advances in Tourism, Technology and Systems', 'AntĂłnio Abreu, DĂˇlia Liberato, Juan Carlos Garcia Ojeda', 'Springer Nature', '2022-07-25', 'Business Analytics', 681, '0000073.jpg', NULL),
('9789811950902', 'Machine Learning in Information and Communication Technology', 'Hiren Kumar Deva Sarma, Vincenzo Piuri, Arun Kumar Pujari', 'Springer Nature', '2022-12-21', 'deep learning', 337, '0000074.jpg', NULL),
('9789811957239', 'Deep Learning Technologies for the Sustainable Development Goals', 'Virender Kadyan, T. P. Singh, Chidiebere Ugwu', 'Springer Nature', '2023-02-01', 'deep learning', 254, '0000075.jpg', NULL),
('9789813297487', 'Joint Training for Neural Machine Translation', 'Yong Cheng', 'Springer Nature', '2019-08-26', 'NLP', 280, '0000076.jpg', NULL),
('9789813361089', 'Deep Learning and Physics', 'Akinori Tanaka, Akio Tomiya, Koji Hashimoto', 'Springer Nature', '2021-03-24', 'deep learning', 207, '0000077.jpg', NULL),
('9789813368156', 'Trends of Data Science and Applications', 'Siddharth Swarup Rautaray, Phani Pemmaraju, Hrushikesha Mohanty', 'Springer Nature', '2021-03-21', 'data science', 341, '0000078.jpg', NULL),
('9789813369122', 'Soft Computing and Signal Processing', 'V. Sivakumar Reddy, V. Kamakshi Prasad, Jiacun Wang, K. T. V. Reddy', 'Springer Nature', '2021-05-20', 'deep learning', 729, '0000079.jpg', NULL),
('9789814545488', 'Information Systems And Technologies For Network Society: Proceedings Of The Ipsj International Symposium', 'Kambayashi Yahiko, Masunaga Yoshifumi, Takizawa Makoto', 'World Scientific', '1997-09-09', 'NLP', 394, '0000080.jpg', NULL),
('9797815374', 'Fundamental Methods of Mathematical Economics', 'Alpha C. Chiang, Kevin Wainwright', 'Erlangga', '2005-02-02', 'maths', 456, '0000081.jpg', NULL),
('9798201063429', 'Profound Python', 'Ă–nder Teker', 'Godoro', '2021-08-07', 'data science', 328, '0000082.jpg', NULL),
('9798215903315', 'Simple Data Science (R)', 'Narayana Nemani', 'Narayana Nemani', '2022-10-26', '', 469, '0000083.jpg', NULL),
('9798351877518', 'Data Visualization', 'Emmanuel Queens', 'Independently Published', '2022-09-09', 'visualization', 434, '0000084.jpg', NULL),
('9798352524756', 'Beginners Course On Data Science', 'Emenwa Global', 'Independently Published', '2022-09-13', 'python', 352, '0000085.jpg', NULL),
('9798362725006', 'Data Visualization', 'James Frey', 'Independently Published', '2022-11-18', 'visualization', 280, '0000086.jpg', NULL),
('9798366932943', 'Data Analytics with Python for Beginners', 'Dr Gurpreet Singh Chhabra , Dr Upasana Sinha, Mr. Prashant Kumar Tamrakar, Mr. Leelkanth Dewangan', 'INENCE PUBLICATIONS PVT LTD', '2022-12-05', 'data science', 271, '0000087.jpg', NULL),
('9798373616027', 'Data-Based Story Telling', 'David Fischer', 'Independently Published', '2023-01-13', 'visualization', 405, '0000088.jpg', NULL),
('9798572621037', 'Step Up for Leadership in Enterprise Data Science & Artificial Intelligence with Big Data', 'Shitalkumar R Sukhdeve', 'Independently Published', '2020-11-27', '', 832, '0000089.jpg', NULL),
('9798577899776', 'Data Analytics Basics', 'Simplilearn', 'IndraStra Whitepapers', '2020-12-14', 'SQL', 288, '0000090.jpg', NULL),
('9798596884821', 'Business Analytics for Beginners and Dummies', 'Lisa H Gregory Ph D', 'Independently Published', '2021-01-18', 'Business Analytics', 40, '0000091.jpg', NULL),
('9798606148011', 'Data Science Job', 'Przemek Chojecki', 'Independently Published', '2020-01-29', 'maths', 96, '0000092.jpg', NULL),
('9798678753441', 'Data Science', 'Benjamin Smith', 'Independently Published', '2020-08-24', 'SQL', 583, '0000093.jpg', NULL),
('9798678761705', 'Deep Learning with Python', 'Benjamin Smith', 'Independently Published', '2020-08-24', 'deep learning', 168, '0000094.jpg', NULL),
('9798697543450', 'Learn Power BI', 'Derek Wilson', 'Independently Published', '2020-10-15', 'visualization', 166, '0000095.jpg', NULL),
('9798846357907', 'Use Window Functions To Write Simpler, Better, More Efficient T-SQL Queries', 'Donna Wallace', 'Independently Published', '2022-08-13', 'SQL', 490, '0000096.jpg', NULL),
('9798847834636', 'The Data Science for Businesses Guide', 'Noah George', 'Independently Published', '2022-08-27', 'data science', 0, '0000097.jpg', NULL),
('9798985822717', 'Artificial Intelligence', 'David Sweenor', 'TinyTechMedia LLC', '2022-04-02', 'Data ethics', 398, '0000098.jpg', NULL),
('9811110689', 'Numsense! Data Science for the Layman', 'Annalyn Ng', 'Annalyn Ng & Kenneth Soo', '2017-03-24', 'python', 600, '0000100.jpg', NULL),
('9811308683', 'Big Data Analysis and Deep Learning Applications', 'Thi Thi Zin, Jerry Chun-Wei Lin', 'Springer', '2018-06-07', 'deep learning', 386, '0000101.jpg', NULL),
('9811346143', 'Understanding the Role of Business Analytics', 'Hardeep Chahal, Jeevan Jyoti, Jochen Wirtz', 'Springer', '2019-10-20', 'Business Analytics', 224, '0000102.jpg', NULL),
('9811358494', 'Deep Learning with R', 'Abhijit Ghatak', 'Springer', '2019-06-08', 'deep learning', 245, '0000103.jpg', NULL),
('9811385777', 'Computational Intelligence, Communications, and Business Analytics', 'Jyotsna Kumar Mandal, Somnath Mukhopadhyay, Paramartha Dutta, Kousik Dasgupta', 'Springer', '2019-06-25', 'Business Analytics', 493, '0000104.jpg', NULL),
('9811385807', 'Computational Intelligence, Communications, and Business Analytics', 'Jyotsna Kumar Mandal, Somnath Mukhopadhyay, Paramartha Dutta, Kousik Dasgupta', 'Springer', '2019-06-26', 'Business Analytics', 495, '0000105.jpg', NULL),
('9811517371', 'Statistics for Data Science and Policy Analysis', 'Azizur Rahman', 'Springer', '2021-04-15', 'statistics', 380, '0000106.jpg', NULL),
('9811518157', 'Deep Learning Applications', 'M. Arif Wani, Mehmed Kantardzic, Moamar Sayed-Mouchaweh', 'Springer', '2020-02-29', 'SQL', 288, '0000107.jpg', NULL),
('9811520372', 'Quantitative Economics with R', 'Vikram Dayal', 'Springer', '2021-02-04', 'data science', 326, '0000108.jpg', NULL),
('9811524068', 'Smart Technologies in Data Science and Communication', 'Jinan Fiaidhi, Debnath Bhattacharyya, N. Thirupathi Rao', 'Springer', '2020-03-31', 'data science', 318, '0000109.jpg', NULL),
('9811526990', 'Advanced Studies in Behaviormetrics and Data Science', 'Tadashi Imaizumi, Atsuho Nakayama, Satoru Yokoyama', 'Springer', '2020-06-05', 'data science', 472, '0000110.jpg', NULL),
('9811533563', 'Applications of Machine Learning', 'Prashant Johri, Jitendra Kumar Verma, Sudip Paul', 'Springer', '2020-05-05', 'deep learning', 394, '0000111.jpg', NULL),
('9811563241', 'Deep Learning for Medical Decision Support Systems', 'Utku Kose, Omer Deperlioglu, Jafar Alzubi, Bogdan Patrut', 'Springer', '2020-06-18', 'deep learning', 171, '0000112.jpg', NULL),
('9811578761', 'Statistical Learning with Math and Python', 'Joe Suzuki', 'Springer', '2021-08-04', 'maths', 256, '0000113.jpg', NULL),
('9811624208', 'Data Science Techniques for Cryptocurrency Blockchains', 'Innar Liiv', 'Springer', '2022-06-25', 'data science', 0, '0000114.jpg', NULL),
('9811633568', 'Deep Learning Applications, Volume 3', 'M. Arif Wani, Bhiksha Raj, Feng Luo, Dejing Dou', 'Springer', '2022-01-16', 'deep learning', 322, '0000115.jpg', NULL),
('9811644853', 'Data Science and Security', 'Samiksha Shukla, Aynur Unal, Joseph Varghese Kureethara, Durgesh Kumar Mishra, Dong Seog Han', 'Springer', '2021-08-27', 'data science', 489, '0000116.jpg', NULL),
('9811659397', 'Data Science', 'Jianchao Zeng, Pinle Qin, Weipeng Jing, Xianhua Song, Zeguang Lu', 'Springer', '2021-09-11', 'data science', 545, '0000117.jpg', NULL),
('9811679959', 'Machine Learning and Autonomous Systems', 'Joy Iong-Zong Chen, Haoxiang Wang, Ke-Lin Du, V. Suma', 'Springer', '2022-03-10', 'maths', 653, '0000118.jpg', NULL),
('9811682321', 'Foundations of Deep Learning', 'Fengxiang He, Dacheng Tao', 'Springer', '2023-02-11', 'deep learning', 0, '0000119.jpg', NULL),
('9811909636', 'Visual Question Answering', 'Qi Wu, Peng Wang, Xin Wang, Xiaodong He, Wenwu Zhu', 'Springer', '2022-05-14', 'NLP', 428, '0000120.jpg', NULL),
('9811922101', 'Data Science and Security', 'Samiksha Shukla, Xiao-Zhi Gao, Joseph Varghese Kureethara, Durgesh Mishra', 'Springer', '2022-07-02', 'data science', 507, '0000121.jpg', NULL),
('9811944520', 'Responsible Data Science', 'Jimson Mathew, G. Santhosh Kumar, Deepak P., Joemon M. Jose', 'Springer', '2022-11-21', 'data science', 0, '0000122.jpg', NULL),
('9811968799', 'Smart Technologies in Data Science and Communication', 'Kingsley A. Ogudo, Sanjoy Kumar Saha, Debnath Bhattacharyya', 'Springer', '2023-01-02', 'data science', 0, '0000123.jpg', NULL),
('9811977011', 'Python Data Science', 'Chaolemen Borjigin', 'Springer', '2023-02-02', 'python', 128, '0000124.jpg', NULL),
('9813149299', 'Business Analytics', 'Jorge L. C. Sanz', 'World Scientific Publishing Company', '2016-09-29', 'Business Analytics', 884, '0000125.jpg', NULL),
('9813366583', 'Applied Advanced Analytics', 'Arnab Kumar Laha', 'Springer', '2022-06-10', 'Business Analytics', 234, '0000126.jpg', NULL),
('982917481', 'Learning Base R', 'Lawrence Mark Leemis', 'Ascended Ideas', '2015-07-08', 'Business Analytics', 274, '0000124.jpg', NULL),
('989453936', 'Teconomics of Budget Ethics', 'Bahman Fakhraie', 'Ferdat Publishing', '2014-03-04', 'Data ethics', 168, '0000124.jpg', NULL),
('995529523', 'Thinking Statistically', 'Uri Bram', 'Capara Books', '2017-07-07', 'statistics', 352, '0000129.jpg', NULL),
('996025537', 'Big Data Science & Analytics', 'Arshdeep Bahga, Vijay Madisetti', 'Vpt', '2016-04-15', 'SQL', 690, '0000130.jpg', NULL),
('996025545', 'Big Data Science & Analytics', 'Arshdeep Bahga, Vijay Madisetti', 'Vpt', '2016-04-15', 'data science', 544, '0000131.jpg', NULL),
('996916032', 'Statistics (the Easier Way) with R, 3rd Ed', 'N. M. Radziwill, Morgan Benton', 'Lapis Lucera', '2019-04-20', '', 552, '0000132.jpg', NULL),
('996916059', 'Statistics (The Easier Way) With R', 'N. M. Radziwill', 'Nicole M Radziwill', '2017-07-27', 'statistics', 221, '0000133.jpg', NULL),
('999064908', 'Principles of Business Forecasting--2nd Ed', 'Keith Ord, Professor of Decision Sciences Keith Ord, Robert Fildes, Nikos Kourentzes', 'Wessex, Incorporated', '2017-08-15', 'Business Analytics', 588, '0000134.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `userId` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `status` tinyint(10) NOT NULL,
  `IPAddress` varchar(15) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `userId`, `email`, `status`, `IPAddress`, `createdAt`) VALUES
(1, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:07:24'),
(2, NULL, 'top@op.lok', 3, '127.0.0.1', '2023-06-12 23:07:55'),
(3, NULL, 'top@op.lok', 5, '127.0.0.1', '2023-06-12 23:08:24'),
(4, NULL, NULL, 9, '127.0.0.1', '2023-06-12 23:08:27'),
(5, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:10:57'),
(7, NULL, NULL, 9, '127.0.0.1', '2023-06-12 23:10:59'),
(8, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:11:42'),
(10, NULL, NULL, 9, '127.0.0.1', '2023-06-12 23:11:47'),
(11, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:15:00'),
(13, NULL, NULL, 9, '127.0.0.1', '2023-06-12 23:15:03'),
(14, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:16:32'),
(16, NULL, NULL, 9, '127.0.0.1', '2023-06-12 23:16:50'),
(17, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:19:28'),
(19, NULL, NULL, 9, '127.0.0.1', '2023-06-12 23:19:30'),
(20, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:21:05'),
(22, NULL, NULL, 9, '127.0.0.1', '2023-06-12 23:21:07'),
(23, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:23:17'),
(25, NULL, NULL, 9, '127.0.0.1', '2023-06-12 23:23:20'),
(26, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:24:34'),
(27, NULL, 'fds', 7, '127.0.0.1', '2023-06-12 23:24:36'),
(28, NULL, 'admin@admin.plp', 3, '127.0.0.1', '2023-06-12 23:25:25'),
(29, NULL, 'admin@admin.plp', 5, '127.0.0.1', '2023-06-12 23:25:40'),
(30, NULL, 'admin@admin.plp', 7, '127.0.0.1', '2023-06-12 23:25:43'),
(31, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:26:27'),
(32, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:28:50'),
(33, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:29:55'),
(34, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 12:54:05'),
(35, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-13 12:54:40'),
(36, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 12:54:51'),
(37, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 12:55:42'),
(38, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 14:17:07'),
(39, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 14:26:15'),
(40, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 14:37:38'),
(41, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 14:39:08'),
(42, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 14:40:44'),
(43, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 14:42:19'),
(44, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-13 14:42:40'),
(45, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-13 14:44:06'),
(46, 5, 'tester@test.test', 5, '127.0.0.1', '2023-06-13 14:44:19'),
(47, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 14:46:17'),
(48, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-13 14:46:59'),
(49, NULL, 'admin@adminfff.pl', 3, '127.0.0.1', '2023-06-13 14:47:25'),
(50, NULL, 'a@a.a', 5, '127.0.0.1', '2023-06-13 14:47:39'),
(51, NULL, 'a@a.a', 7, '127.0.0.1', '2023-06-13 14:47:57'),
(52, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-13 14:49:47'),
(53, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-13 14:49:51'),
(54, 5, 'tester@test.test', 5, '127.0.0.1', '2023-06-13 14:49:59'),
(55, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 14:53:13'),
(56, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-13 14:53:22'),
(57, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-13 14:54:10'),
(58, 5, 'tester@test.test', 5, '127.0.0.1', '2023-06-13 14:54:16'),
(59, 5, 'tester@test.test', 5, '127.0.0.1', '2023-06-13 14:54:20'),
(60, 3, 'admin@admin.pl', 6, '127.0.0.1', '2023-06-13 14:54:26'),
(61, 5, 'tester@test.test', 6, '127.0.0.1', '2023-06-13 14:54:33'),
(62, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 14:55:00'),
(63, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 15:14:07'),
(64, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 15:16:12'),
(65, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 15:18:56'),
(66, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 15:21:29'),
(67, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 15:27:23'),
(68, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 15:28:35'),
(69, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 15:32:31'),
(70, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-13 15:40:36'),
(71, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 15:48:53'),
(72, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 15:59:40'),
(73, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 15:59:50'),
(74, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:00:17'),
(75, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:01:54'),
(76, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:04:20'),
(77, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:05:53'),
(78, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:07:07'),
(79, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:11:11'),
(80, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:11:48'),
(81, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:12:08'),
(82, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:13:25'),
(83, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:14:38'),
(84, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:15:26'),
(85, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:19:53'),
(86, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:22:02'),
(87, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:28:26'),
(88, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:28:44'),
(89, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:31:37'),
(90, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:32:12'),
(91, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:34:18'),
(92, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:35:36'),
(93, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:42:30'),
(94, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:44:51'),
(95, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:45:39'),
(96, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:46:12'),
(97, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:47:27'),
(98, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:51:55'),
(99, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:52:56'),
(100, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 16:58:07'),
(101, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:00:16'),
(102, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:03:51'),
(103, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:05:58'),
(104, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:07:12'),
(105, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:11:45'),
(106, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:13:50'),
(107, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:28:38'),
(108, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:29:13'),
(109, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:31:11'),
(110, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:31:35'),
(111, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:31:48'),
(112, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-13 17:32:04'),
(113, 5, 'tester@test.test', 5, '127.0.0.1', '2023-06-13 17:32:13'),
(114, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:33:08'),
(115, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:36:27'),
(116, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:37:07'),
(117, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:38:18'),
(118, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:38:35'),
(119, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:38:51'),
(120, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:39:09'),
(121, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:45:46'),
(122, NULL, 'pop@p.p', 2, '127.0.0.1', '2023-06-13 17:49:49'),
(123, NULL, 'pop@p.p', 2, '127.0.0.1', '2023-06-13 17:49:49'),
(124, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-13 17:49:57'),
(125, NULL, 'pop@p.p', 3, '127.0.0.1', '2023-06-13 17:50:24'),
(126, NULL, 'pop@p.p', 5, '127.0.0.1', '2023-06-13 17:50:34'),
(127, NULL, 'test@test.test', 3, '127.0.0.1', '2023-06-13 17:51:04'),
(128, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-13 17:53:00'),
(129, NULL, 'test@test.test', 7, '127.0.0.1', '2023-06-13 17:53:07'),
(130, NULL, 'pop@p.p', 7, '127.0.0.1', '2023-06-13 17:53:11'),
(131, NULL, 'pop@p.p', 3, '127.0.0.1', '2023-06-13 17:53:58'),
(132, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-13 17:54:03'),
(133, NULL, 'pop@p.p', 7, '127.0.0.1', '2023-06-13 17:54:07'),
(134, 31, 'pop@p.p', 3, '127.0.0.1', '2023-06-13 17:54:25'),
(135, 31, 'pop@p.p', 1, '127.0.0.1', '2023-06-13 17:54:34'),
(136, 5, 'tester@test.test', 1, '127.0.0.1', '2023-06-13 17:56:25'),
(137, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-13 17:57:22'),
(138, 3, 'admin@wsb.pl', 5, '127.0.0.1', '2023-06-13 17:57:37'),
(139, 3, 'admin@wsb.pl', 5, '127.0.0.1', '2023-06-13 17:57:48'),
(140, 31, 'librarian@wsb.pl', 5, '127.0.0.1', '2023-06-13 17:58:21'),
(141, 5, 'user@wsb.pl', 5, '127.0.0.1', '2023-06-13 17:58:51'),
(142, 3, 'admin@wsb.pl', 5, '127.0.0.1', '2023-06-13 17:58:57'),
(143, 31, 'librarian@wsb.pl', 5, '127.0.0.1', '2023-06-13 17:59:03'),
(144, 5, 'user@wsb.pl', 5, '127.0.0.1', '2023-06-13 17:59:09'),
(145, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-13 18:00:07'),
(146, 3, 'admin@wsb.pl', 1, '127.0.0.1', '2023-06-13 18:00:16'),
(147, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-13 18:00:27'),
(148, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-13 18:03:00'),
(149, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-13 18:03:24'),
(150, 3, 'admin@wsb.pl', 1, '127.0.0.1', '2023-06-13 18:03:34'),
(151, 3, 'admin@wsb.pl', 1, '127.0.0.1', '2023-06-14 11:08:13'),
(152, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 11:08:20'),
(153, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 11:09:11'),
(154, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 11:13:05'),
(155, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 11:13:27'),
(156, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 11:13:52'),
(157, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 11:42:46'),
(158, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 11:49:00'),
(159, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 11:49:46'),
(160, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 11:51:28'),
(161, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 11:56:23'),
(162, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 11:57:01'),
(163, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 11:58:36'),
(164, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:01:53'),
(165, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:07:21'),
(166, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:10:52'),
(167, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:11:05'),
(168, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:13:01'),
(169, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:14:22'),
(170, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:17:16'),
(171, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:17:21'),
(172, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:19:01'),
(173, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:20:16'),
(174, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:22:09'),
(175, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:24:28'),
(176, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:26:39'),
(177, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:29:52'),
(178, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:32:50'),
(179, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:35:51'),
(180, 3, 'admin@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:36:46'),
(181, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:39:01'),
(182, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:39:11'),
(183, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:52:43'),
(184, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 12:56:42'),
(185, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:04:45'),
(186, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:06:26'),
(187, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:09:28'),
(188, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:12:01'),
(189, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:18:07'),
(190, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:20:14'),
(191, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:23:11'),
(192, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:30:20'),
(193, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:31:35'),
(194, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:33:51'),
(195, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:35:11'),
(196, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:39:36'),
(197, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:41:15'),
(198, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:44:12'),
(199, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:50:38'),
(200, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:52:46'),
(201, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 13:56:32'),
(202, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 14:00:45'),
(203, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 14:05:06'),
(204, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 14:08:58'),
(205, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 14:15:13'),
(206, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 14:24:14'),
(207, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 14:27:09'),
(208, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 14:28:39'),
(209, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 14:30:16'),
(210, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 14:36:23'),
(211, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 14:39:35'),
(212, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 14:44:00'),
(213, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 14:56:46'),
(214, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 14:59:53'),
(215, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 15:03:16'),
(216, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 15:05:32'),
(217, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 15:14:23'),
(218, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 15:16:54'),
(219, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 15:19:21'),
(220, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 15:23:48'),
(221, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 15:26:37'),
(222, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 15:31:20'),
(223, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 15:32:54'),
(224, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 15:34:25'),
(225, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 15:34:44'),
(226, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 15:35:01'),
(227, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 15:36:03'),
(228, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 15:37:13'),
(229, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 16:00:22'),
(230, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 16:17:07'),
(231, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 16:21:43'),
(232, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 20:46:36'),
(233, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 20:47:52'),
(234, 3, 'admin@wsb.pl', 1, '127.0.0.1', '2023-06-14 20:52:49'),
(235, 3, 'admin@wsb.pl', 1, '127.0.0.1', '2023-06-14 20:53:07'),
(236, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 20:54:33'),
(237, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 20:54:57'),
(238, NULL, 'pop@p.p', 6, '127.0.0.1', '2023-06-14 20:56:52'),
(239, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 20:57:15'),
(240, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 20:59:30'),
(241, NULL, 'pop@p.p', 6, '127.0.0.1', '2023-06-14 20:59:49'),
(242, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:01:52'),
(243, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:02:11'),
(244, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:02:19'),
(245, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:02:39'),
(246, 3, 'admin@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:02:44'),
(247, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:05:52'),
(248, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:11:11'),
(249, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:12:19'),
(250, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:24:15'),
(251, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:30:12'),
(252, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:37:35'),
(253, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:37:35'),
(254, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:39:37'),
(255, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:43:45'),
(256, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:47:39'),
(257, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:48:51'),
(258, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:50:36'),
(259, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:52:14'),
(260, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:53:52'),
(261, 3, 'admin@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:54:26'),
(262, 32, 'user@user.user', 3, '127.0.0.1', '2023-06-14 21:54:52'),
(263, 32, 'user@user.user', 1, '127.0.0.1', '2023-06-14 21:55:03'),
(264, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:55:24'),
(265, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:55:28'),
(266, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:58:51'),
(267, 3, 'admin@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:59:01'),
(268, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 21:59:08'),
(269, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:01:11'),
(270, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:01:11'),
(271, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:03:18'),
(272, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:06:48'),
(273, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:09:14'),
(274, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:11:43'),
(275, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:12:51'),
(276, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:18:27'),
(277, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:22:32'),
(278, 3, 'admin@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:23:20'),
(279, 3, 'admin@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:25:07'),
(280, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:25:13'),
(281, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:25:22'),
(282, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:37:10'),
(283, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:43:24'),
(284, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:45:17'),
(285, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:47:26'),
(286, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:48:56'),
(287, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:49:36'),
(288, 31, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:52:57'),
(289, 5, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-14 22:55:08');

-- --------------------------------------------------------

--
-- Table structure for table `logs_type`
--

CREATE TABLE `logs_type` (
  `id` tinyint(10) NOT NULL,
  `type` enum('logged','not logged','registered','not registered','updated','not updated','deleted','not deleted','error','unknown') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logs_type`
--

INSERT INTO `logs_type` (`id`, `type`) VALUES
(1, 'logged'),
(2, 'not logged'),
(3, 'registered'),
(4, 'not registered'),
(5, 'updated'),
(6, 'not updated'),
(7, 'deleted'),
(8, 'not deleted'),
(9, 'error'),
(10, 'unknown');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `permission` enum('user','librarian','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `permission`) VALUES
(1, 'user'),
(2, 'librarian'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

CREATE TABLE `rental` (
  `id` int(10) NOT NULL,
  `userId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rental`
--

INSERT INTO `rental` (`id`, `userId`) VALUES
(10, 5),
(11, 32);

-- --------------------------------------------------------

--
-- Table structure for table `rental_info`
--

CREATE TABLE `rental_info` (
  `id` int(11) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `rentalDate` date NOT NULL DEFAULT current_timestamp(),
  `returnDate` date DEFAULT NULL,
  `accept` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rental_info`
--

INSERT INTO `rental_info` (`id`, `isbn`, `rentalDate`, `returnDate`, `accept`) VALUES
(10, '9789391019310', '2023-06-14', '2023-06-15', 1),
(10, '9789391030070', '2023-06-14', NULL, 0),
(11, '9789391030353', '2023-06-14', '2023-06-15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `permissionId` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `email` varchar(64) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `password` varchar(150) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `permissionId`, `email`, `firstName`, `lastName`, `birthday`, `password`, `createdAt`, `image`) VALUES
(3, 3, 'admin@wsb.pl', 'Admin', 'Adminek', '2023-06-10', '$2y$10$LWJ0ofmV1rWVZmZL7I28h.slQjUoqbAmOH1GcT4eCjhaeO9KXfrnq', '2023-06-10 22:10:20', '2.jpg'),
(5, 1, 'user@wsb.pl', 'User', 'Userek', '2023-06-10', '$2y$10$TTsftg/N2VtGJmTAlzo7QOr.rH3rLXlQeY./kHOsXxSMXD7eqkExm', '2023-06-10 22:25:07', '5.jpg'),
(31, 2, 'librarian@wsb.pl', 'Librarian', 'Lib', '2230-03-12', '$2y$10$5K9OabMh1p/o284L7XRPW.he1v.jEJGww552jaMEPnU9JzH0/yfSu', '2023-06-13 19:54:25', '6.jpg'),
(32, 1, 'user@user.user', 'tmp', 'tmp', '2023-11-11', '$2y$10$4f9R1A7aZ0ZvmuORsF0lK.vjqaB6QdBRobgyGybjGI0hGVKzakevy', '2023-06-14 23:54:52', '3.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`isbn`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `logs_type`
--
ALTER TABLE `logs_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissionId` (`permissionId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=290;

--
-- AUTO_INCREMENT for table `logs_type`
--
ALTER TABLE `logs_type`
  MODIFY `id` tinyint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rental`
--
ALTER TABLE `rental`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`status`) REFERENCES `logs_type` (`id`),
  ADD CONSTRAINT `logs_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permissions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
