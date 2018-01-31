#include <iostream>
#include "OpenCVSimplification.h"
#include <QDir>
#include <QString>

int main() {
	std::cout << "started" << std::endl;

	QString filename = "data/slice_001.png";
	std::vector<cv::Mat> voxel_data;

	// get directory
	QDir dir = QFileInfo(filename).absoluteDir();
	std::cout << dir.dirName().toUtf8().constData() << std::endl;
	
	// scan all the files in the directory to get a voxel data
	QStringList files = dir.entryList(QDir::NoDotAndDotDot | QDir::Files, QDir::DirsFirst);
	std::cout << files.size() << " files found." << std::endl;
	voxel_data.resize(files.size());
	for (int i = 0; i < files.size(); i++) {
		voxel_data[i] = cv::imread((dir.absolutePath() + "/" + files[i]).toUtf8().constData(), cv::IMREAD_GRAYSCALE);
	}
	std::cout << "voxel data was loaded." << std::endl;
	
	std::vector<Building> buildings;

	lego::OpenCVSimplification sim(voxel_data, 1, 0.7, 1, 0.5);
	sim.simplify(buildings);
	
	std::cout << buildings.size() << " buildings are generated." << std::endl;

	return 0;
}