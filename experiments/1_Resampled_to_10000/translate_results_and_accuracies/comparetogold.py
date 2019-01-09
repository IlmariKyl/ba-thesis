import sys, os


def main(argv):

	if len(argv) != 2:
		print("Usage: python comparetogold.py <predictions_file> <gold_file>")
		sys.exit(2)

	linecount = 0

	infilename = argv[0].split("/")[-1]
	infilepath = os.path.abspath(argv[0])
	goldfilepath = os.path.abspath(argv[1])
	goldfilename = argv[1].split("/")[-1]

	outfilename = infilename+"_-_VS_-_"+goldfilename

	try:
		with open(infilepath, 'r') as pred, open(goldfilepath, 'r') as gold, open(outfilename, 'w') as outfile:

			print("Input files:\npred: "+infilename+"\ngold: "+goldfilename, file=outfile)
			print("\n\nWrong predictions:\n", file=outfile)
			wrong_n = 0
			
			for line1, line2 in zip(pred, gold):
				linecount += 1
				if line1 != line2:
					wrong_n += 1
					print("\n{}:\n{:<12} {}\n{:<12} {}"\
						  .format(wrong_n, "Predicted:", line1.strip("\n"), "Gold:", line2).strip("\n"),\
						  end="\n\n", file=outfile)

			percentage = str(((linecount-wrong_n) / linecount) * 100)+"%"
			outfile.write("\n--------------------------------\n\nAccuracy: "+percentage)
			print("\nAccuracy:", percentage)

	except Exception as e:
		print(e)


if __name__ == "__main__":
   main(sys.argv[1:])
