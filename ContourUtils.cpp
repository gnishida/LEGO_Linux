#include "ContourUtils.h"
#include <iostream>

namespace util {
	
	void Polygon::translate(float x, float y) {
		for (int i = 0; i < contour.size(); i++) {
			contour[i].x += x;
			contour[i].y += y;
		}
		for (int i = 0; i < holes.size(); i++) {
			for (int j = 0; j < holes[i].size(); j++) {
				holes[i][j].x += x;
				holes[i][j].y += y;
			}
		}
	}

	/**
	 * Remove the redundant points that have the same coordinates.
	 */
	std::vector<cv::Point> removeRedundantPoint(const std::vector<cv::Point>& polygon) {
		std::vector<cv::Point> ans;
		if (polygon.size() == 0) return ans;

		ans.push_back(polygon[0]);
		for (int i = 1; i < polygon.size(); i++) {
			if (polygon[i] != polygon[i - 1]) {
				ans.push_back(polygon[i]);
			}
		}
		if (ans.size() > 1 && ans.back() == ans.front()) ans.pop_back();

		return ans;
	}

	std::vector<cv::Point2f> removeRedundantPoint(const std::vector<cv::Point2f>& polygon) {
		std::vector<cv::Point2f> ans;
		if (polygon.size() == 0) return ans;

		ans.push_back(polygon[0]);
		for (int i = 1; i < polygon.size(); i++) {
			if (polygon[i] != polygon[i - 1]) {
				ans.push_back(polygon[i]);
			}
		}
		if (ans.size() > 1 && ans.back() == ans.front()) ans.pop_back();

		return ans;
	}

	cv::Rect boundingBox(const std::vector<cv::Point>& polygon) {
		int min_x = std::numeric_limits<int>::max();
		int max_x = -std::numeric_limits<int>::max();
		int min_y = std::numeric_limits<int>::max();
		int max_y = -std::numeric_limits<int>::max();
		for (int i = 0; i < polygon.size(); i++) {
			min_x = std::min(min_x, polygon[i].x);
			max_x = std::max(max_x, polygon[i].x);
			min_y = std::min(min_y, polygon[i].y);
			max_y = std::max(max_y, polygon[i].y);
		}

		return cv::Rect(min_x, min_y, max_x - min_x + 1, max_y - min_y + 1);
	}

	cv::Rect boundingBox(const std::vector<cv::Point2f>& polygon) {
		int min_x = std::numeric_limits<int>::max();
		int max_x = -std::numeric_limits<int>::max();
		int min_y = std::numeric_limits<int>::max();
		int max_y = -std::numeric_limits<int>::max();
		for (int i = 0; i < polygon.size(); i++) {
			min_x = std::min(min_x, (int)polygon[i].x);
			max_x = std::max(max_x, (int)polygon[i].x);
			min_y = std::min(min_y, (int)polygon[i].y);
			max_y = std::max(max_y, (int)polygon[i].y);
		}

		return cv::Rect(min_x, min_y, max_x - min_x + 1, max_y - min_y + 1);
	}

	/**
	* Calculate the intersection over union (IOU) inside the specified roi.
	* The images have to be CV_8U type.
	*/
	double calculateIOU(const cv::Mat& img, const cv::Mat& img2) {
		int union_cnt = 0;
		int inter_cnt = 0;
		for (int r = 0; r < img.rows; r++) {
			for (int c = 0; c < img.cols; c++) {
				if (img.at<uchar>(r, c) == 255 || img2.at<uchar>(r, c) == 255) union_cnt++;
				if (img.at<uchar>(r, c) == 255 && img2.at<uchar>(r, c) == 255) inter_cnt++;
			}
		}

		return (double)inter_cnt / union_cnt;
	}

	/**
	* Calculate the intersection over union (IOU) inside the specified roi.
	* The images have to be CV_8U type.
	* Check the IOU only within the specified region, rect.
	*/
	double calculateIOU(const cv::Mat& img1, const cv::Mat& img2, const cv::Rect& rect) {
		int union_cnt = 0;
		int inter_cnt = 0;

		for (int r = rect.y; r < rect.y + rect.height; r++) {
			for (int c = rect.x; c < rect.x + rect.width; c++) {
				if (img1.at<uchar>(r, c) == 255 || img2.at<uchar>(r, c) == 255) union_cnt++;
				if (img1.at<uchar>(r, c) == 255 && img2.at<uchar>(r, c) == 255) inter_cnt++;
			}
		}

		return (float)inter_cnt / union_cnt;
	}

	/**
	 * Helper function to extract contours from the input image.
	 * The image has to be of type CV_8U, and has values either 0 or 255.
	 * Note that the input image is not modified by this function.
	 */
	std::vector<Polygon> findContours(const cv::Mat& img) {
		std::vector<Polygon> ans;

		// dilate the image
		cv::Mat dilated = img.clone();
		/*
		cv::Mat_<uchar> kernel = (cv::Mat_<uchar>(3, 3) << 1, 1, 0, 1, 1, 0, 0, 0, 0);
		cv::dilate(dilated, dilated, kernel);
		*/

		// add padding to the image
		cv::Mat padded(dilated.rows + 2, dilated.cols + 2, CV_8U, cv::Scalar(0));
		dilated.copyTo(padded(cv::Rect(1, 1, dilated.cols, dilated.rows)));

		// extract contours
		std::vector<std::vector<cv::Point>> contours;
		std::vector<cv::Vec4i> hierarchy;
		cv::findContours(padded, contours, hierarchy, cv::RETR_CCOMP, cv::CHAIN_APPROX_SIMPLE, cv::Point(0, 0));

		for (int i = 0; i < hierarchy.size(); i++) {
			if (hierarchy[i][3] != -1) continue;
			if (contours[i].size() < 3) continue;

			Polygon polygon;
			polygon.contour.resize(contours[i].size());
			for (int j = 0; j < contours[i].size(); j++) {
				polygon.contour[j] = cv::Point2f(contours[i][j].x, contours[i][j].y);
			}

			// obtain all the holes inside this contour
			int hole_id = hierarchy[i][2];
			while (hole_id != -1) {
				std::vector<cv::Point2f> hole(contours[hole_id].size());
				for (int j = 0; j < contours[hole_id].size(); j++) {
					hole[j] = cv::Point2f(contours[hole_id][j].x, contours[hole_id][j].y);
				}
				polygon.holes.push_back(hole);
				hole_id = hierarchy[hole_id][0];
			}

			// since we added 1px of padding, we need to adjust the coordinates of the polygon
			polygon.translate(-1, -1);

			ans.push_back(polygon);
		}

		return ans;
	}

	/**
 	 * My custom contour extraction
	 * Currently, only the right-angle corner is supported, and only one contour is supported.
	 *
	 *
	 * @param img		input single-channel image (0 - background, 255 - footprint)
	 * @param contour	output contour polygon
	 */
	void findContour(const cv::Mat& img, std::vector<cv::Point>& contour) {
		contour.clear();

		// find the start point
		cv::Point start;
		bool found = false;
		for (int r = 0; r < img.rows && !found; r++) {
			for (int c = 0; c < img.cols; c++) {
				if (img.at<uchar>(r, c) == 255) {
					start = cv::Point(c, r);
					found = true;
					break;
				}
			}
		}

		cv::Point prev_dir(1, 0);
		cv::Point cur = start;
		contour.push_back(cur);
		int cnt = 0;
		do {
			cnt++;
			if (cnt > 1000) {
				break;
			}

			cv::Point left_dir(prev_dir.y, -prev_dir.x);
			cv::Point next = cur + left_dir;
			if (img.at<uchar>(next.y, next.x) == 255) {
				if (contour.size() > 0 && contour.back() != cur) contour.push_back(cur);
				cur = next;
				prev_dir = left_dir;
				continue;
			}

			/*
			cv::Point left_fore_dir = prev_dir + left_dir;
			if (std::abs(left_fore_dir.x) > 1) left_fore_dir.x /= std::abs(left_fore_dir.x);
			if (std::abs(left_fore_dir.y) > 1) left_fore_dir.y /= std::abs(left_fore_dir.y);
			next = cur + left_fore_dir;
			if (img.at<uchar>(next.y, next.x) == 255) {
			if (contour.size() > 0 && contour.back() != cur) contour.push_back(cur);
			cur = next;
			prev_dir = left_fore_dir;
			continue;
			}
			*/

			next = cur + prev_dir;
			if (img.at<uchar>(next.y, next.x) == 255) {
				cur = next;
				continue;
			}

			/*
			cv::Point right_fore_dir = prev_dir - left_dir;
			if (std::abs(right_fore_dir.x) > 1) right_fore_dir.x /= std::abs(right_fore_dir.x);
			if (std::abs(right_fore_dir.y) > 1) right_fore_dir.y /= std::abs(right_fore_dir.y);
			next = cur + right_fore_dir;
			if (img.at<uchar>(next.y, next.x) == 255) {
			if (contour.size() > 0 && contour.back() != cur) contour.push_back(cur);
			cur = next;
			prev_dir = right_fore_dir;
			continue;
			}
			*/

			cv::Point right_dir(-prev_dir.y, prev_dir.x);
			next = cur + right_dir;
			if (img.at<uchar>(next.y, next.x) == 255) {
				if (contour.size() > 0 && contour.back() != cur) contour.push_back(cur);
				cur = next;
				prev_dir = right_dir;
				continue;
			}

			cv::Point back_dir = -prev_dir;
			next = cur + back_dir;
			if (img.at<uchar>(next.y, next.x) == 255) {
				//contour.push_back(cur);
				cur = next;
				prev_dir = back_dir;
				continue;
			}

			break;
		} while (cur != start);
	}

	/**
	 * Create image from the contour.
	 */
	void createImageFromContour(int width, int height, const std::vector<cv::Point>& contour, const cv::Point& offset, cv::Mat& result) {
		result = cv::Mat(height, width, CV_8U, cv::Scalar(0));
		std::vector<std::vector<cv::Point>> contour_points(1);
		contour_points[0] = contour;
		cv::fillPoly(result, contour_points, cv::Scalar(255), cv::LINE_4, 0, offset);
	}

	void createImageFromPolygon(int width, int height, const Polygon& polygon, const cv::Point& offset, cv::Mat& result) {
		result = cv::Mat(height, width, CV_8U, cv::Scalar(0));
		std::vector<std::vector<cv::Point>> contour_points(1 + polygon.holes.size());

		contour_points[0].resize(polygon.contour.size());
		for (int i = 0; i < polygon.contour.size(); i++) {
			contour_points[0][i] = cv::Point(polygon.contour[i].x, polygon.contour[i].y);
		}
		for (int i = 0; i < polygon.holes.size(); i++) {
			contour_points[i + 1].resize(polygon.holes[i].size());
			for (int j = 0; j < polygon.holes[i].size(); j++) {
				contour_points[i + 1][j] = cv::Point(polygon.holes[i][j].x, polygon.holes[i][j].y);
			}
		}
		cv::fillPoly(result, contour_points, cv::Scalar(255), cv::LINE_4, 0, offset);
	}

	void snapPolygon(const std::vector<cv::Point2f>& ref_polygon, std::vector<cv::Point2f>& polygon, float snap_vertex_threshold, float snap_edge_threshold) {
		for (int i = 0; i < polygon.size(); i++) {
			// find the closest point
			double min_length = std::numeric_limits<double>::max();
			int min_index = -1;
			for (int j = 0; j < ref_polygon.size(); j++) {
				double length = cv::norm(polygon[i] - ref_polygon[j]);
				if (length < min_length) {
					min_length = length;
					min_index = j;
				}
			}

			if (min_length < snap_vertex_threshold) {
				polygon[i] = ref_polygon[min_index];
			}
			else {
				min_length = std::numeric_limits<double>::max();
				cv::Point2f min_pt;
				// find the closest edge
				for (int j = 0; j < ref_polygon.size(); j++) {
					int next = (j + 1) % ref_polygon.size();
					cv::Point2f pt;
					double length = closestPoint(ref_polygon[j], ref_polygon[next], polygon[i], true, pt);
					if (length < min_length) {
						min_length = length;
						min_pt = pt;
					}
				}

				if (min_length < snap_edge_threshold) {
					polygon[i] = min_pt;
				}
			}
		}
	}

	float crossProduct(const cv::Point2f& v1, const cv::Point2f& v2) {
		return v1.x * v2.y - v1.y * v2.x;
	}

	float dotProduct(const cv::Point2f& v1, const cv::Point2f& v2) {
		return v1.x * v2.x + v1.y * v2.y;
	}

	/*
	 * Return the distance from segment ab to point c.
	 */
	float closestPoint(const cv::Point2f& a, const cv::Point2f& b, const cv::Point2f& c, bool segmentOnly, cv::Point2f& pt) {
		float r_numerator = dotProduct(c - a, b - a);
		float r_denomenator = dotProduct(b - a, b - a);

		if (r_denomenator <= 0.0f) {
			return cv::norm(a - c);
		}

		float r = r_numerator / r_denomenator;

		if (segmentOnly && (r < 0 || r > 1)) {
			float dist1 = std::hypot(c.x - a.x, c.y - a.y);
			float dist2 = std::hypot(c.x - b.x, c.y - b.y);
			if (dist1 < dist2) {
				pt = a;
				return dist1;
			}
			else {
				pt = b;
				return dist2;
			}
		}
		else {
			pt = a + (b - a) * r;
			return std::abs(crossProduct(c - a, b - a)) / sqrt(r_denomenator);
		}
	}

}
