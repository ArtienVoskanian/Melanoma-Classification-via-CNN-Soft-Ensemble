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

## Requirement
Python version: 3.11

## Dependencies
numpy, pandas, matplotlib, seaborn, Pillow, scikit-image, tqdm, scipy, scikit-learn, torch, torchvision, timm
```bash
pip install numpy pandas matplotlib seaborn Pillow scikit-image tqdm scipy scikit-learn torch torchvision timm
```
> For GPU support, install PyTorch with the appropriate CUDA version via the [PyTorch installation guide](https://pytorch.org/get-started/locally/).
## Download Data

The ISIC image dataset is ~25GB (plus metadata), so it is **not included in this repo**.  
Use the provided script to download the required files into the project’s `Datasets/` directory.

### Steps

From the `z16/data` directory, run:

```bash
cd z16/data
bash scripts/get_isic_data.sh
# or, if executable:
./scripts/get_isic_data.sh
```

### Output location

After running, you should have files under:

- `z16/data/Datasets/ISIC_2020_Training_JPEG.zip`
- `z16/data/Datasets/ISIC_2020_Training_GroundTruth_v2.csv`
- `z16/data/Datasets/ISIC_2019_Test_Input.zip`
- `z16/data/Datasets/ISIC_2019_Test_GroundTruth.csv`
- `z16/data/Datasets/ISIC_2019_Test_Metadata.csv`

### Notes

- Ensure you have at least **~30GB free** before downloading.
- The `Datasets/` directory is ignored by git (not committed).
