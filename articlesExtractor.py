import pickle

def main():
	file_name = "/Users/adeelahuma/Documents/Grad School/Data Analytics 2/data/fake_news.pickle"
	fake_news_dir = "/Users/adeelahuma/Documents/Grad School/Data Analytics 2/data/fake_news/"
	
	file_object = open(file_name, 'r')
	
	files = pickle.load(file_object)
	
	print 'copying article files...'
	
	i=0
	for file in files:
		ff_name= fake_news_dir+"fake_" + str(i) + ".txt"
		print ff_name
		fake_file = open(ff_name, "w")
		fake_file.write(str(file))
		fake_file.close()
		i = i + 1
		
if __name__ == "__main__":
	main()
	