# Melanoma-Classification-via-CNN-Soft-Ensemble
Deep learning framework for melanoma classification using transfer learning (ResNet50, EfficientNet) with cross-dataset validation and domain shift analysis.

This project implements a deep learning pipeline for melanoma classification using dermoscopic images from the ISIC 2020 dataset. The primary objective is to evaluate transfer learning–based convolutional neural networks and assess their generalization performance under cross-dataset domain shift.

Unlike many in-domain validation studies, this project explicitly evaluates external generalization by training on ISIC 2020 and testing on ISIC 2019, where ground-truth labels are publicly available. This setup provides insight into robustness under real-world distribution variation — a critical challenge in medical AI deployment.

## **Key Features**

Transfer learning with ResNet50 and EfficientNet-B4

Cross-dataset evaluation (ISIC 2020 → ISIC 2019)

Class imbalance handling (augmentation + class-weighted loss)

Custom ResizeWithPadding preprocessing to preserve lesion morphology

Baseline comparison using handcrafted dermatologic features + Random Forest

ROC and Precision–Recall analysis under extreme class imbalance

Exploration of ensemble modeling for improved robustness
